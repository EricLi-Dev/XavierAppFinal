//
//  WebView.swift
//  XavierApp
//
//  Created by Eric Li on 7/22/20.
//

import Foundation
import SwiftUI
import WebKit
import Combine

class WebViewModel: ObservableObject {
    @Published var link: String
    @Published var didFinishLoading: Bool = false

    init (link: String) {
        self.link = link
    }
}

struct WebView: UIViewRepresentable {
    let contentController = ContentController()
    @ObservedObject var viewModel: WebViewModel
    @ObservedObject var userSettings = UserSettings()
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
                if let url = URL(string: viewModel.link) {
                    webView.load(URLRequest(url: url))
                }
        webView.configuration.userContentController.add(contentController, name: "jsHandler")
        webView.configuration.userContentController.add(contentController, name: "jsHandlerr")
        webView.configuration.userContentController.add(contentController, name: "jsHandlerrr")
                return webView
    }

    func updateUIView(_ view: WKWebView, context _: Context) {
        
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        // your code here
        
                        view.evaluateJavaScript("""
                                if (window.location.href == "https://www.plusportals.com/xavierhs") {
        
                                                              document.getElementById("UserName")
                                                                .addEventListener("input", function (evt) {
                                                               window.webkit.messageHandlers.jsHandlerr.postMessage(this.value);
                                                           });
                                   document.getElementById("Password")
                                     .addEventListener("input", function (evt) {
                                    window.webkit.messageHandlers.jsHandler.postMessage(this.value);
                                });
                                } else {
                                                                window.webkit.messageHandlers.jsHandlerrr.postMessage("DONE!");
                                }
                                
 """,
                                                completionHandler: { (html: Any?, _: Error?) in
        //                                           print(html)
                                                })
                    }
       
        
        return
//        if view.url == nil {
//            view.load(request)
//            view.configuration.userContentController.add(contentController, name: "jsHandler")
//            view.configuration.userContentController.add(contentController, name: "jsHandlerr")
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                // your code here
//
//                view.evaluateJavaScript("""
//
//                                                      document.getElementById("UserName")
//                                                        .addEventListener("input", function (evt) {
//                                                       window.webkit.messageHandlers.jsHandlerr.postMessage(this.value);
//                                                   });
//                           document.getElementById("Password")
//                             .addEventListener("input", function (evt) {
//                            window.webkit.messageHandlers.jsHandler.postMessage(this.value);
//                        });
//
//
//            """,
//                                        completionHandler: { (html: Any?, _: Error?) in
////                                           print(html)
//                                        })
//                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                view.evaluateJavaScript("document.querySelectorAll('.pointer').length;",
//                                           completionHandler: { (html: Any?, error: Error?) in
//                                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                                            if let count = html as? Int{
//                                                for i in 0...count {
//                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                                    print(i)
//                                                    view.evaluateJavaScript("document.getElementsByClassName('pointer')[\(i)].innerHTML;",
//                                                                               completionHandler: { (html: Any?, error: Error?) in
//                                                                             print(html)
//                                                    })
//                                                    }
//                                                }
//                                            }
//                                            }
//                })
//
//                }
               
//            }
//        }
    }
    class ContentController: NSObject, WKScriptMessageHandler {
        @ObservedObject var userSettings = UserSettings()
            func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
                if message.name == "jsHandler"{
                    print("Password:")
                    print(message.body)
                }
                if message.name == "jsHandlerr"{
                    print("Username:")
                    print(message.body)
                }
                if message.name == "jsHandlerrr"{
                    print("CHANGE:")
                    userSettings.finishPlus = true
                    print(userSettings.finishPlus)
                    
                }
                
                
            }
        }
    class Coordinator: NSObject, WKNavigationDelegate {
            private var viewModel: WebViewModel
            
            init(_ viewModel: WebViewModel) {
                self.viewModel = viewModel
            }

            func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
                //print("WebView: navigation finished")
                self.viewModel.didFinishLoading = true
            }
        }

        func makeCoordinator() -> WebView.Coordinator {
            Coordinator(viewModel)
        }
}

//
//  WebView.swift
//  XavierApp
//
//  Created by Eric Li on 7/22/20.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context _: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()

        let webView = WKWebView(frame: .zero, configuration: webConfiguration)

        return webView
    }

    func updateUIView(_ view: WKWebView, context _: Context) {
        print(UserDefaults.standard.object(forKey: "Schedule"))
        if view.url == nil {
            view.load(request)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // your code here

                view.evaluateJavaScript("document.getElementById('UserName').value='ledwitht21@nycxavierhs.org';document.getElementById('Password').value='Surddiyi%32';document.getElementsByClassName('btn btn-primary pull-right')[0].click();",
                                        completionHandler: { (_: Any?, _: Error?) in
                                            // print(html)
                                        })
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    view.evaluateJavaScript("window.location.href = 'https://plusportals.com/Print/PrintSchedule?scheduleFor=Student&rotation=9'", completionHandler: { (html: Any?, _: Error?) in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                            view.evaluateJavaScript("document.querySelectorAll('.schedule-techno').length;",

                                                    completionHandler: { (html: Any?, _: Error?) in
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                                            if var count = html as? Int {
                                                                if count >= 16 {
                                                                    count = 15
                                                                }
                                                                UserDefaults.standard.set("", forKey: "Schedule")
                                                                for i in 0 ... count {
                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                                        print(i)
                                                                        view.evaluateJavaScript("document.getElementsByClassName('schedule-techno')[\(i)].innerHTML;",
                                                                                                completionHandler: { (html: Any?, _: Error?) in
                                                                                                    if UserDefaults.standard.string(forKey: "Schedule") != nil {
                                                                                                        let temp = UserDefaults.standard.string(forKey: "Schedule")
                                                                                                        let stringy = html as? String

                                                                                                        let new = temp! + "," + (stringy ?? "")

                                                                                                        UserDefaults.standard.set(new, forKey: "Schedule")
                                                                                                    } else {
                                                                                                        let stringy = html as? String

                                                                                                        UserDefaults.standard.set(stringy, forKey: "Schedule")
                                                                                                    }
                                                                                                })
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        print(UserDefaults.standard.string(forKey: "Schedule"))
                                                    })
                        }
                    })
                }
            }
        }
    }
}

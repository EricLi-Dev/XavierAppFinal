import SwiftUI
import Foundation
import WebKit

class Coordinator: NSObject {
    var webview: Webview

    init(_ webview: Webview) {
        self.webview = webview
    }

    @objc func startCamera(sender: WKWebView) {
        webview.startCamera()
    }
}

class EmbeddedWebviewController: UIViewController, WKNavigationDelegate {

    var webview: WKWebView
    //var router: WebviewRouter? = nil

    public var delegate: Coordinator? = nil

    init(coordinator: Coordinator) {
        self.delegate = coordinator
        self.webview = WKWebView()
        super.init(nibName: nil, bundle: nil)
        let contentController = ContentController()
        webview.configuration.userContentController.add(contentController, name: "jsHandler")
        webview.configuration.userContentController.add(contentController, name: "jsHandlerr")
        webview.configuration.userContentController.add(contentController, name: "jsHandlerrr")
    }

    required init?(coder: NSCoder) {
        self.webview = WKWebView()
        super.init(coder: coder)
    }

    public func loadUrl(_ url: URL) {
        webview.load(URLRequest(url: url))
    }

    override func loadView() {
        self.webview.navigationDelegate = self
        view = webview
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = (navigationResponse.response as! HTTPURLResponse).url else {
            decisionHandler(.cancel)
            return
        }

        if url.absoluteString.starts(with: "https://www.plusportals.com/ParentStudentDetails") {
            decisionHandler(.cancel)
            self.delegate?.startCamera(sender: self.webview)
        }
        else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                // your code here

                webView.evaluateJavaScript("""
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
            decisionHandler(.allow)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
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
class WebviewModel: ObservableObject {
    @Published var loggedOut: Bool = false
    @Published var shouldRedirectToCameraView: Bool = false
    @Published var navbarHidden: Bool = false
    func startCamera() {
        print("Started Camera")
        DispatchQueue.main.async {
            self.shouldRedirectToCameraView.toggle()
        }
    }
}

struct Webview : UIViewControllerRepresentable {
    @ObservedObject var model: WebviewModel

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> EmbeddedWebviewController {
        let webViewController = EmbeddedWebviewController(coordinator: context.coordinator)
        webViewController.loadUrl(URL(string:"https://www.plusportals.com/xavierhs")!)
        
        return webViewController
    }

    func updateUIViewController(_ uiViewController: EmbeddedWebviewController, context: UIViewControllerRepresentableContext<Webview>) {
        
    }

    func startCamera() {
        model.startCamera()
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login")
    }
}

struct CameraView: View {
    @ObservedObject var model: WebviewModel
    var body: some View {
        Text("CameraView")
    }
}

struct WebviewContainer: View {
    @ObservedObject var model: WebviewModel = WebviewModel()
    var body: some View {
        return NavigationView {
            VStack {
                

                NavigationLink(destination: PageTwo()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true), isActive: $model.shouldRedirectToCameraView) {
                    EmptyView()
                    
                }.navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                Webview(model: self.model)
                
            }
        }
    }
}


struct ContentView: View {

    var body: some View {
        WebviewContainer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


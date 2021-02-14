//
//  XavierAppApp.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import Firebase
import GoogleAPIClientForREST
import GoogleSignIn
import SwiftUI

@main
struct XavierAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
//            MotherView()
//             cardView()
            OnboardingView()
//            // mainView()
//            studentView()
        }
    }
}

// App Delegate

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    @Published var email = ""
    @Published var name = ""
    private let id = "913385353421-4m9hu2nfcpa07vvmunfvkcnte5c3k9f8.apps.googleusercontent.com"
    
    let events = webScrape(source: "http://www.xavierhs.org/controls/cms_v2/components/rss/rss.aspx?sid=81&gid=1&calcid=2913&page_id=1666")
    let userSettings = UserDefaults()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        GIDSignIn.sharedInstance()?.clientID = id
        
        
        

        return true
    }

   
}

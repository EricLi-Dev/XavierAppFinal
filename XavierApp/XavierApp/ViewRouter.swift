//
//  ViewRouter.swift
//  XavierApp
//
//  Created by Eric Li on 7/13/20.
//

import Foundation

// Launches mainView if onboardingView has already been launched
class ViewRouter: ObservableObject {
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "mainView"
        }
    }

    @Published var currentPage: String
}

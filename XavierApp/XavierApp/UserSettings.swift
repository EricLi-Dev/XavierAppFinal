//
//  UserSettings.swift
//  XavierApp
//
//  Created by Eric Li on 7/8/20.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }

    @Published var isParent: Bool {
        didSet {
            UserDefaults.standard.set(isParent, forKey: "isParent")
        }
    }

    @Published var isStudent: Bool {
        didSet {
            UserDefaults.standard.set(isStudent, forKey: "isStudent")
        }
    }

    @Published var viewSwitch: Bool {
        didSet {
            UserDefaults.standard.set(viewSwitch, forKey: "viewSwitch")
        }
    }

    init() {
        name = UserDefaults.standard.object(forKey: "name") as? String ?? ""

        isParent = UserDefaults.standard.object(forKey: "isParent") as? Bool ?? false

        isStudent = UserDefaults.standard.object(forKey: "isStudent") as? Bool ?? false

        viewSwitch = UserDefaults.standard.object(forKey: "viewSwitch") as? Bool ?? false
    }
}

//
//  MotherView.swift
//  XavierApp
//
//  Created by Eric Li on 7/13/20.
//

import Foundation
import SwiftUI

struct MotherView: View{
    @ObservedObject var viewRouter = ViewRouter()
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == "onboardingView"{
                OnboardingView()
            } else if viewRouter.currentPage == "mainView" {
                if (userSettings.isParent == true){
                        parentView()
                } else {
                   studentView()
                }
            }

        }
        
    }
    
    
    
    
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View{
        MotherView().environmentObject(ViewRouter())
    }
}

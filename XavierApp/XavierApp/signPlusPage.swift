//
//  signPage.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 1/28/21.
//

import SwiftUI

struct signPage: View {
    var body: some View {
        NavigationView {
            GeometryReader{ comb in
            ZStack {
                Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Great!")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)

                    Text("Now, we want to make your experience with the app more tailored to you.\n \nIf you have a PlusPortals login, \nplease sign in now.")
                        .font(.system(size: 25, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, comb.size.height/20)
//                    TextField("Tyler Wing Wong", text: $userSettings.name)
//                        .foregroundColor(.black) // Black Text
//                        .padding(10)
//                        .border(Color("Blue"))
//                        .multilineTextAlignment(.center)
//
//                        .background(Capsule())
//                        .foregroundColor(.white) // White Background
//                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("Blue"), lineWidth: 1))
                    // .position(x: 180, y: -40)
                    NavigationLink(
                        destination: PageTwo()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)) {
                        Text("Sign in with Plus Portals ")
                            .font(.system(size: 22, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                        
                    }
                    .frame(height: comb.size.height/13, alignment: .center)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    .padding(.top, comb.size.height/5)
                    NavigationLink(
                        destination: PageTwo()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)) {
                        Text("Skip")
                            .font(.system(size: 22, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.top)
                    }
                    .padding(.horizontal)
                    .padding()
                    .accentColor(Color.white)
                    
                }.hiddenNavigationBarStyle()
            }
            
            }
        }
    }
}

struct signPage_Previews: PreviewProvider {
    static var previews: some View {
        signPage()
    }
}

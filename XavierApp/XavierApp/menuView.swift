//
//  warningView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 7/22/20.
//

import SwiftUI
struct MenuContent: View {
    let isOpen: Bool
    let width: CGFloat
    var body: some View {
        ZStack {
        Circle()
            .fill(Color.white)
            .scaleEffect(self.isOpen ? width/30 : 0.0)
            NavigationView{
            GeometryReader{ g in
                VStack{
                    
                    
                    
                    

                    
                    
                        
                        
                    
                    
                    
                }
            }
            .navigationBarHidden(true)
            }.opacity(self.isOpen ? 1 : 0.0)
        }
        
    }
}

struct menuView: View {
    let width: CGFloat
    let isOpen: Bool
    @State var scale: CGFloat = 0
    let menuClose: () -> Void
    var body: some View {
        
        ZStack {
            MenuContent(isOpen: self.isOpen, width: self.width)
                .frame(width: self.width)
                .animation(Animation.easeOut(duration: 0.8))
                .zIndex(4)
                

            Circle()
                .fill(Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255))
                .scaleEffect(self.isOpen ? width/2000 : 0.0)
                .animation(Animation.easeOut(duration: 0.8))
                .zIndex(5)
                .onTapGesture {
                    self.menuClose()
                }
        }
        
    }
}

// struct menuView_Previews: PreviewProvider {
//    static var previews: some View {
//        menuView()
//    }
// }

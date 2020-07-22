//
//  menuButtonView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
//

import SwiftUI

struct menuButtonView: View {
    @State var scale1: CGFloat = 0
         @State private var step = false
    var whoop = Circle()
    var body: some View {
      
        
        Button(action: {
            print("menuButton clicked")
            
            if step == true {
                step = false;
            } else {
                step = true;
            }
                        
        }) {
                        
            Image(systemName: "smallcircle.fill.circle.fill" )
                    .font(.system(size: 35.0))
                .frame(minWidth: 0, maxWidth: 25, minHeight: 0, maxHeight: 25)
                .foregroundColor(.white)
            if step == true {
                                   whoop
                                       .fill(Color.white)
                                       .offset(x: 0, y: 0)
                                       .frame(width: 500.0, height: 500.0)
                                       .scaleEffect(scale1)
           
                                       .animate(autoreverses: true) { self.scale1 = 1
                                       }
                                       .offset(x: -170, y: -390.0)
                whoop
                                       .fill(Color(red: 132/255, green: 49/255, blue: 80/255))
                                       .offset(x: 0, y: 0)
                                       .frame(width: 50, height: 50)
                                       .scaleEffect(scale1)
           
                                       .animate(autoreverses: true) { self.scale1 = 1
                                       }
                                       .offset(x: -170, y: -390.0)
           
           
                               }
                               if step == false {
                                whoop
                                       .fill(Color.white)
                                       .offset(x: 0, y: 0)
                                       .frame(width: 500.0, height: 500.0)
                                       .scaleEffect(scale1)
           
                                       .animate(autoreverses: true) { self.scale1 = 0
                                       }
                                   .offset(x: -170, y: -390.0)
                                whoop
                                       .fill(Color(red: 132/255, green: 49/255, blue: 80/255))
                                       .offset(x: 0, y: 0)
                                       .frame(width: 50, height: 50)
                                       .scaleEffect(scale1)
           
                                       .animate(autoreverses: true) { self.scale1 = 0
                                       }
                                       .offset(x: -170, y: -390.0)
           
                               }
            }
            }
        
        
    }


struct menuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        menuButtonView()
    }
}

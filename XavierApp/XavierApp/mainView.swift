//
//  ContentView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import SwiftUI


extension View {
    func animate(using animation: Animation = Animation.easeOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation

        return onAppear {
            withAnimation(repeated) {
                action()
                
            }
        }
    }
    func animateIn(using animation: Animation = Animation.easeIn(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation

        return onAppear {
            withAnimation(repeated) {
                action()
                
            }
        }
    }
}


struct mainView: View {
    
    @State var scale1: CGFloat = 0
    @State private var step = false
    var circleAnimation = Circle()
    
        var body: some View {
            ZStack {
                
                backgroundView()
                VStack {
                    HStack(spacing: (UIScreen.main.bounds.size.width/4)*2.75)  {
                        menuButtonView()
                        warningButtonView();
                    }
                    mainTextView()
                }
                
            }
            .hiddenNavigationBarStyle()
            .foregroundColor(.white)
            
            
        }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}


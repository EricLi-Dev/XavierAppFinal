//
//  backgroundView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
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

struct backgroundView: View {
    @State var scale: CGFloat = 0
    var body: some View {
        
        Circle()
            .fill(Color(red: 132/255, green: 49/255, blue: 80/255))
            .offset(x: 0, y: 75.0)
            .frame(width: 800.0, height: 800.0)
            .scaleEffect(scale)
            .animate(autoreverses: true) { self.scale = 1
                }
            .offset(x: 0, y: -525)
            .animation(.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2))
        
    }
}

struct backgroundView_Previews: PreviewProvider {
    static var previews: some View {
        backgroundView()
    }
}

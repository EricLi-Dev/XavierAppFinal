//
//  backgroundView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
//

import SwiftUI

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

//
//  warningView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 7/22/20.
//

import SwiftUI
struct MenuContent: View {
    var body: some View {
        Circle()
            .fill(Color.white)
    }
}

struct menuView: View {
    let width: CGFloat
    let isOpen: Bool
    @State var scale: CGFloat = 0
    let menuClose: () -> Void
    var body: some View {
        ZStack {
            MenuContent()
                .frame(width: self.width)
                .scaleEffect(self.isOpen ? 10.0 : 0.0)
                .animation(Animation.easeOut(duration: 0.8))
                .zIndex(4)
                

            Circle()
                .fill(Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255))
                .scaleEffect(self.isOpen ? 0.125 : 0.0)
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

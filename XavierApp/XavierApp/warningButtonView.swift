//
//  warningButtonView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
//

import SwiftUI

struct warningButtonView: View {
    var body: some View {
        Button(action: {
            print("warning pressed")

        }) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 35.0))
                .frame(minWidth: 0, maxWidth: 25, minHeight: 0, maxHeight: 25)
                .foregroundColor(Color(red: 250 / 255, green: 244 / 255, blue: 140 / 255))
                .animation(.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2))
        }
    }
}

struct warningButtonView_Previews: PreviewProvider {
    static var previews: some View {
        warningButtonView()
    }
}

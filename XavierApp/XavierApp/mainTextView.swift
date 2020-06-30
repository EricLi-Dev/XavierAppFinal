//
//  mainTextView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
//

import SwiftUI

struct mainTextView: View {
    var body: some View {
        Text("Wednesday\nJuly 23rd 2020")
            .frame(width: 300, height: 200, alignment: .center)
            .foregroundColor(.white)
            .font(.custom("Helvetica Neue Medium", size: 35))
            .animation(.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2))
            
    }
}

struct mainTextView_Previews: PreviewProvider {
    static var previews: some View {
        mainTextView()
    }
}

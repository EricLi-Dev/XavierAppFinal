//
//  logoOnOne.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 1/27/21.
//

import SwiftUI

struct logoOnOne: View {
    var body: some View {
        HStack {
            Text("XAVIER")
                .font(.custom("Times New Roman", size: 37))
                .foregroundColor(Color.white)
            Image("xavier1")
        }
    }
}

struct logoOnOne_Previews: PreviewProvider {
    static var previews: some View {
        logoOnOne()
    }
}

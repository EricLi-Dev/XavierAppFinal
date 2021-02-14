//
//  purpbleCircle.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 1/27/21.
//

import SwiftUI

struct purpbleCircle: View {
    var body: some View {
        Circle()
            .fill(Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255))
            .scaleEffect(2)
    }
}

struct purpbleCircle_Previews: PreviewProvider {
    static var previews: some View {
        purpbleCircle()
    }
}

//
//  onboardOneBack.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 1/27/21.
//

import SwiftUI

struct onboardOneBack: View {
    var body: some View {
        Image("xavierBack")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

struct onboardOneBack_Previews: PreviewProvider {
    static var previews: some View {
        onboardOneBack()
    }
}

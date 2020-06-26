//
//  menuButtonView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
//

import SwiftUI

struct menuButtonView: View {
    var body: some View {
        Button(action: {
            print("menuButton clicked")
                
                        
        }) {
                        
            Image(systemName: "smallcircle.fill.circle.fill" )
                    .font(.system(size: 35.0))
                .frame(minWidth: 0, maxWidth: 25, minHeight: 0, maxHeight: 25)
                .foregroundColor(.white)
            }

        }
        
    }


struct menuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        menuButtonView()
    }
}

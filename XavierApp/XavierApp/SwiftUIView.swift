//
//  SwiftUIView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 1/31/21.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var model = WebViewModel(link: "https://www.plusportals.com/xavierhs")
    @ObservedObject var userSettings = UserSettings()
    @State var signInSuccess = false
//    @ViewBuilder
        var body: some View {
//        NavigationView {
//            if userSettings.finishPlus {
//                    PageTwo()
//                } else {
//                    WebView(viewModel: model)
//                }
            if self.userSettings.finishPlus {
                        WebView(viewModel: model)
                    }
                    else {
                        PageTwo()
                    }
//                print("yeo")
//            }
//                }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

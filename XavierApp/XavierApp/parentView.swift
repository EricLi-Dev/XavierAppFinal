//
//  ContentView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import SwiftUI

struct parentView: View {
    @ObservedObject var userSettings = UserSettings()
    @State var scale1: CGFloat = 0
    @State private var step = false
    var circleAnimation = Circle()

    var body: some View {
        ZStack{
            ZStack{
                backgroundView()
            }
        GeometryReader { g in


                VStack {
                    VStack {
                        ZStack {
                            // Cards
                            GeometryReader { gr in

                                CarouselView(itemHeight: gr.size.height / 2.2,
                                             views: [
                                                 AnyView(
                                                     PPCard()

                                                 ),
                                                 AnyView(
                                                     MiscCard()
                                                 ),
                                                 AnyView(
                                                     CalendarCard()
                                                 ),
                                                 AnyView(
                                                     PPCard()
                                                 ),
                                                 AnyView(
                                                     MiscCard()
                                                 ),
                                                 AnyView(
                                                     CalendarCard()
                                                 ),
                                                 AnyView(
                                                     PPCard()
                                                 ),
                                                 AnyView(
                                                     MiscCard()
                                                 ),
                                                 AnyView(
                                                     CalendarCard()
                                                 ),
                                                 AnyView(
                                                     PPCard()
                                                 ),

                                             ])
                            }
                        }
                    }
                    // .background(Color.blue)
                    .frame(width: g.size.width, height: g.size.height / 1.07)
                }
            }
        
        }
        // .hiddenNavigationBarStyle()
    }
}

struct parentView_Previews: PreviewProvider {
    static var previews: some View {
        parentView()
    }
}

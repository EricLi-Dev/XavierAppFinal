//
//  ContentView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import SwiftUI

struct studentView: View {
    @ObservedObject var userSettings = UserSettings()
    @State var isOn: Bool = false
    @State private var step = false
    var circleAnimation = Circle()

    var body: some View {
        ZStack {
            backgroundView()

            GeometryReader { g in

                ZStack {
                    VStack {
//                    VStack{
//                        ZStack{
//
//                            //Text("Goodmorning " + self.userSettings.name)
//
//                    }
//                    }
//                    //.background(Color.red)
//                    .frame(width: g.size.width, height: g.size.height/3)

                        VStack {
                            ZStack {
                                // Cards
                                GeometryReader { gr in

                                    CarouselView(itemHeight: gr.size.height / 2.2,
                                                 views: [
                                                     AnyView(
                                                         VStack {
                                                             Text("Lunch")
                                                                 .foregroundColor(.black)

                                                             // Toggle(isOn: self.$userSettings.viewSwitch){
                                                             // Text("ParentView")
                                                             // }

//                                if userSettings.viewSwitch == true {
//                                    parentView()
//                                } else{
//                                    studentView()
//                                }

                                                         }),
                                                     AnyView(Text("Schedule")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Calendar")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Lunch")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Schedule")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Calendar")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Lunch")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Schedule")
                                                         .foregroundColor(.black)),
                                                     AnyView(Text("Calendar")
                                                         .foregroundColor(.black)),

                                                 ])
                                }
                            }
                        }
                        // .background(Color.blue)
                        .frame(width: g.size.width, height: g.size.height / 1.07)
                    }
                }
            }
        }
        .hiddenNavigationBarStyle()
    }
}

struct studentView_Previews: PreviewProvider {
    static var previews: some View {
        studentView()
    }
}

//
//  warningButtonView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/26/20.
//

import SwiftUI

struct pageIndicator: View {
    @EnvironmentObject var pageNumber: pageNumber
    @State var swipe: Int = 1
    // @State var number: Int

    var body: some View {
        ZStack {
//            Text("\(number)")

            GeometryReader { gr in
                VStack {
                    Spacer()
                    Text("")
                        .padding(105)
                    Spacer()
                    HStack(alignment: .center) {
                        // 1st Circle
                        if self.swipe == 3 {
                            Circle()
                                .fill(Color("Blue"))
                                .frame(width: gr.size.width / 4, height: gr.size.height / 10)
                        } else {
                            Circle()
                                .stroke()
                                .fill(Color.gray)
                                .frame(width: gr.size.width / 4, height: gr.size.height / 10)
                        }
                        // 2nd Circle
                        if self.swipe == 1 {
                            Circle()
                                .fill(Color("Blue"))
                                .frame(width: gr.size.width / 4, height: gr.size.height / 10)
                        } else {
                            Circle()
                                .stroke()
                                .fill(Color.gray)
                                .frame(width: gr.size.width / 4, height: gr.size.height / 10)
                        }
                        // 3rd Circle
                        if self.swipe == 2 {
                            Circle()
                                .fill(Color("Blue"))
                                .frame(width: gr.size.width / 4, height: gr.size.height / 10)
                        } else {
                            Circle()
                                .stroke()
                                .fill(Color.gray)
                                .frame(width: gr.size.width / 4, height: gr.size.height / 10)
                        }

                        Text("\(pageNumber.page)")
                    }
                    .frame(width: gr.size.width, height: gr.size.height / 4)
                }
            }
        }
        // .background(Color.white)
        .gesture(
            DragGesture()
                .onEnded { value in

                    if value.translation.width > 1 {
                        // Going to left card
                        print("Swiped to theright")

                        self.swipe -= 1

                        if self.swipe < 1 {
                            self.swipe = 3
                        }

                    } else if value.translation.width < -1 {
                        // Going to right card
                        print("Swiped to theleft")
                        self.swipe += 1

                        if self.swipe > 3 {
                            self.swipe = 1
                        }
                    }
                }
        )
    }
}

struct pageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        pageIndicator()
    }
}

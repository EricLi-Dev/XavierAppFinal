//
//  ContentView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import SwiftUI


struct mainView: View {
    
    @State var scale1: CGFloat = 0
    @State private var step = false
    var circleAnimation = Circle()
    
        var body: some View {
            ZStack {
                
                
                ZStack{
                    backgroundView()
                    VStack {
                        HStack(spacing:     (UIScreen.main.bounds.size  .width/4)*2.75)  {
                            menuButtonView()
                            warningButtonView();
                        }
                        mainTextView()
                    }
                }
                
            VStack{
            Spacer()
                Text("")
                    .padding(115)
            Spacer()
            
            CarouselView(itemHeight: 450,
                views: [
                    AnyView(Text("Lunch")),
                    AnyView(Text("Schedule")),
                    AnyView(Text("Calendar"))
                
                
                
                
                ])
            }
        }
        .hiddenNavigationBarStyle()
          
        
        }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}


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
                
               
                
                
        GeometryReader{ g in
            
            ZStack{
                VStack{
                    
                    
                    VStack{
                        ZStack{
                            //Cards
                            GeometryReader{ gr in
                        
                                CarouselView( itemHeight: gr.size.height/2.2,
                            views: [
                                AnyView(
                                    LunchCard()
                                    ),
                                AnyView(
                                    ScheduleCard()
                                    ),
                                AnyView(
                                    CalendarCard()
                                    ),
                                AnyView(
                                    LunchCard()
                                ),
                                AnyView(
                                    ScheduleCard()
                                ),
                                AnyView(
                                    CalendarCard()
                                ),
                                AnyView(
                                    LunchCard()
                                ),
                                AnyView(
                                    ScheduleCard()
                                ),
                                AnyView(
                                    CalendarCard()
                                )
                            
                            ])
                        
                        }
                            
                            
                }
                
            }
            //.background(Color.blue)
                    .frame(width: g.size.width, height: g.size.height/1.07)
            
                    
                    
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


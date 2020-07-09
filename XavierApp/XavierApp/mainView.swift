//
//  ContentView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import SwiftUI


struct mainView: View {
    
    @State var swipe: Int = 1
    
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
                
                
        GeometryReader{ g in
            
            ZStack{
                VStack{
                    VStack{
                        ZStack{
                        
                        Text("")
                            
                    }
                    }
                    .background(Color.red)
                    .frame(width: g.size.width, height: g.size.height/3)
                    
                    
                    VStack{
                        ZStack{
                            //Cards
                            GeometryReader{ gr in
                        
                                CarouselView( itemHeight: gr.size.height,
                            views: [
                                AnyView(Text("Lunch")
                                            .foregroundColor(.black)
                                        
                                
                                ),
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
                                            .foregroundColor(.black))
                            
                            ])
                        
                        }
                
//                        //PageIndicators
//                            GeometryReader{ geo in
//                                VStack{
//                                    Spacer()
//                                        Text("")
//                                            .padding(105)
//                                    Spacer()
//                                HStack(alignment: .center){
//                                            
//                                   
//                                    
//                                    //1st Circle
//                                    if (self.swipe == 3){
//                                        Circle()
//                                            .fill(Color("Blue"))
//                                            .frame(width: geo.size.width/40, height: geo.size.height/10)
//                                    } else {
//                                        Circle()
//                                            .stroke()
//                                            .fill(Color.gray)
//                                            .frame(width: geo.size.width/40, height: geo.size.height/10)
//                                    }
//                                    //2nd Circle
//                                    if (self.swipe == 1){
//                                        Circle()
//                                            .fill(Color("Blue"))
//                                            .frame(width: geo.size.width/40, height: geo.size.height/10)
//                                    } else {
//                                        Circle()
//                                            .stroke()
//                                            .fill(Color.gray)
//                                            .frame(width: geo.size.width/40, height: geo.size.height/10)
//                                    }
//                                    //3rd Circle
//                                    if (self.swipe == 2){
//                                        Circle()
//                                            .fill(Color("Blue"))
//                                            .frame(width: geo.size.width/40, height: geo.size.height/10)
//                                    } else {
//                                        Circle()
//                                            .stroke()
//                                            .fill(Color.gray)
//                                            .frame(width: geo.size.width/40, height: geo.size.height/10)
//                                    }
//                                    
//                                    Text("\(swipe)")
//                                    
//                                }
//                                .frame(width: geo.size.width, height: geo.size.height)
//                                
//                                    
//                          }
//                        }
                            
                            
                }
                
            }
            //.background(Color.blue)
            .frame(width: g.size.width, height: g.size.height/2)
            
                    
                    
        }
                
    }
           
            
                
            
           
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


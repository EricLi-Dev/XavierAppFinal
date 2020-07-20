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
//                    VStack{
//                        ZStack{
//
//                            //Text("Goodmorning " + self.userSettings.name)
//
//                    }
//                    }
//                    //.background(Color.red)
//                    .frame(width: g.size.width, height: g.size.height/3)
                    
                    
                    VStack{
                        ZStack{
                            //Cards
                            GeometryReader{ gr in
                        
                                CarouselView( itemHeight: gr.size.height/2.2,
                            views: [
                                AnyView(
                                    VStack{
                                    Text("Events")
                                        .foregroundColor(.black)
                                        
//                                        Toggle(isOn: self.$userSettings.viewSwitch){
//                                        Text("ParentView")
//                                    }
                                    
//                                if userSettings.viewSwitch == true {
//                                    parentView()
//                                } else{
//                                    studentView()
//                                }
//
                                    }
                                        
                                
                                ),
                                AnyView(Text("Misc.")
                                            .foregroundColor(.black)),
                                AnyView(Text("Calendar")
                                            .foregroundColor(.black)),
                                AnyView(Text("Events")
                                            .foregroundColor(.black)),
                                AnyView(Text("Misc.")
                                            .foregroundColor(.black)),
                                AnyView(Text("Calendar")
                                            .foregroundColor(.black)),
                                AnyView(Text("Events")
                                            .foregroundColor(.black)),
                                AnyView(Text("Misc.")
                                            .foregroundColor(.black)),
                                AnyView(Text("Calendar")
                                            .foregroundColor(.black))
                            
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

struct parentView_Previews: PreviewProvider {
    static var previews: some View {
        parentView()
    }
}


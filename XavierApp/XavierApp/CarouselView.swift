//
//  CarouselView.swift
//  codeTutorial_carousel
//
//  Created by Christopher Guirguis on 3/17/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct CarouselView: View {

    @GestureState private var dragState = DragState.inactive
    @State var carouselLocation = 0
    
    var itemHeight:CGFloat
    var views:[AnyView]
    
    
    private func onDragEnded(drag: DragGesture.Value) {
        print("drag ended")
        let dragThreshold:CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold{
            carouselLocation =  carouselLocation - 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
        {
            carouselLocation =  carouselLocation + 1
        }
    }
    
    
    
    var body: some View {
        
        
        let stack = ZStack{
            
//            VStack{
//                Text("\(dragState.translation.width)")
//                Text("Carousel Location = \(carouselLocation)")
//                Text("Relative Location = \(relativeLoc())")
//                Text("\(relativeLoc()) / \(views.count-1)")
//                Spacer()
//            }
            VStack{
                
                ZStack{
                    ForEach(0..<views.count){i in
                        GeometryReader{ gr in
                        VStack{
                            Spacer()
                            self.views[i]
                                //Text("\(i)")
                            
                            .frame(width:300, height: self.getHeight(i))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                                
                                
                            .opacity(self.getOpacity(i))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            .offset(x: self.getOffset(i))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            Spacer()
                        }.frame(width: gr.size.width, height: gr.size.height)
                        }
                    }
                    
                }.gesture(
                    
                    DragGesture()
                        .updating($dragState) { drag, state, transaction in
                            state = .dragging(translation: drag.translation)
                    }
                    .onEnded(onDragEnded)
                    
                )
                
                Spacer()
            }
                //page = relativeLoc() + 1
                
               //PageIndicators
                GeometryReader{ geo in
                    VStack{
//                        if (page < 1) {
//                            page = 3
//
//                            Text("")
//
//                        }
//                        if (page > 3) {
//                            page = 1
//
//                            Text("")
//
//                        }
                        
                        Spacer()
                            Text("")
                                .padding(105)
                        Spacer()
                    HStack(alignment: .center){
                        
                     
                        
                        //1st Circle
                        if ((relativeLoc() + 1) % 3 == 0){
                            Circle()
                                .fill(Color("Blue"))
                                .frame(width: geo.size.width/40, height: geo.size.height/10)
                        } else {
                            Circle()
                                .stroke()
                                .fill(Color.gray)
                                .frame(width: geo.size.width/40, height: geo.size.height/10)
                            
                        }
                        //2nd Circle
                        if ((relativeLoc() + 1) % 3 == 1){
                            Circle()
                                .fill(Color("Blue"))
                                .frame(width: geo.size.width/40, height: geo.size.height/10)
                        } else {
                            Circle()
                                .stroke()
                                .fill(Color.gray)
                                .frame(width: geo.size.width/40, height: geo.size.height/10)
                        }
                        //3rd Circle
                        if ((relativeLoc() + 1) % 3 == 2){
                            Circle()
                                .fill(Color("Blue"))
                                .frame(width: geo.size.width/40, height: geo.size.height/10)
                        } else {
                            Circle()
                                .stroke()
                                .fill(Color.gray)
                                .frame(width: geo.size.width/40, height: geo.size.height/10)
                        }
                        
                        //Text("\(page)")
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                        
              }
            }
                
               
            
            
            
            
           

            
        }
        return stack
        
        
    }
    
    func relativeLoc() -> Int{
        
       return ((views.count * 10000) + carouselLocation) % views.count
        
    }
    
    
    
    func getHeight(_ i:Int) -> CGFloat{
        if i == relativeLoc(){
            return itemHeight
        } else {
            return itemHeight - 100
        }
    }


    func getOpacity(_ i:Int) -> Double{
        
        if i == relativeLoc()
            || i + 1 == relativeLoc()
            || i - 1 == relativeLoc()
            || i + 2 == relativeLoc()
            || i - 2 == relativeLoc()
            || (i + 1) - views.count == relativeLoc()
            || (i - 1) + views.count == relativeLoc()
            || (i + 2) - views.count == relativeLoc()
            || (i - 2) + views.count == relativeLoc()
        {
            return 1
        } else {
            return 0
        }
    }
    
    func getOffset(_ i:Int) -> CGFloat{
        
        //This sets up the central offset
        if (i) == relativeLoc()
        {
            //Set offset of cental
            return self.dragState.translation.width
        }
            //These set up the offset +/- 1
        else if
            (i) == relativeLoc() + 1
                ||
                (relativeLoc() == views.count - 1 && i == 0)
        {
            //Set offset +1
            return self.dragState.translation.width + (300 + 20)
        }
        else if
            (i) == relativeLoc() - 1
                ||
                (relativeLoc() == 0 && (i) == views.count - 1)
        {
            //Set offset -1
            return self.dragState.translation.width - (300 + 20)
        }
            //These set up the offset +/- 2
        else if
            (i) == relativeLoc() + 2
                ||
                (relativeLoc() == views.count-1 && i == 1)
                ||
                (relativeLoc() == views.count-2 && i == 0)
        {
            return self.dragState.translation.width + (2*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 2
                ||
                (relativeLoc() == 1 && i == views.count-1)
                ||
                (relativeLoc() == 0 && i == views.count-2)
        {
            //Set offset -2
            return self.dragState.translation.width - (2*(300 + 20))
        }
            //These set up the offset +/- 3
        else if
            (i) == relativeLoc() + 3
                ||
                (relativeLoc() == views.count-1 && i == 2)
                ||
                (relativeLoc() == views.count-2 && i == 1)
                ||
                (relativeLoc() == views.count-3 && i == 0)
        {
            return self.dragState.translation.width + (3*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 3
                ||
                (relativeLoc() == 2 && i == views.count-1)
                ||
                (relativeLoc() == 1 && i == views.count-2)
                ||
                (relativeLoc() == 0 && i == views.count-3)
        {
            //Set offset -2
            return self.dragState.translation.width - (3*(300 + 20))
        }
            //This is the remainder
        else {
            return 10000
        }
    }
    
    
    
    
}





enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

    
    



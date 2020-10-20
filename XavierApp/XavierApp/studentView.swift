//
//  ContentView.swift
//  XavierApp
//
//  Created by Thomas Ledwith on 6/24/20.
//

import SwiftUI
import WebKit
import SwiftSoup

struct studentView: View {
    @ObservedObject var userSettings = UserSettings()
    @State var isOn: Bool = false
    @State private var step = false
    @State var menuOpen: Bool = false
    @State var isOpen = false
    @State var warningOpen: Bool = false
    let webScraper = webScrape(source: "http://www.xavierhs.org/s/81/rd16/start.aspx")
    
    var circleAnimation = Circle()
    
        var body: some View {
            
           ZStack {
          
            
                ZStack{
                    backgroundView()
                }.blur(radius: self.isOpen ? 10 : 0.0)
                
        GeometryReader{ g in
            
            ZStack{
                VStack{
                    HStack {
                        ZStack {
                            if !self.menuOpen {
                                Button(action: {
                                    self.openMenu()
                                }) {
                                    Image(systemName: "smallcircle.fill.circle.fill")
                                        .font(.system(size: 35.0))
                                        .frame(minWidth: 0, maxWidth: 25, minHeight: 0, maxHeight: 25)
                                        .foregroundColor(.white)
                                }
                            }

                            menuView(width: g.size.width,
                                     isOpen: self.menuOpen,
                                     menuClose: self.openMenu)
                        }.frame(width: g.size.width/3, height: g.size.height / 10)
                        .blur(radius: self.isOpen ? 10 : 0.0)
                        .zIndex(-50)
                        ZStack {
                            
                        }.zIndex(100)
                        .popup(isPresented: $isOpen, autohideIn: 15 ) {
                            HStack {
                                Text("Warning!!!!")
                            }
                            .frame(width: 200, height: 60)
                            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
                            .cornerRadius(30.0)
                            .zIndex(100)
                            
                        } .zIndex(100)
                        
                        ZStack {
                            
                                Button(action: {
                                    isOpen.toggle()
                                }) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .font(.system(size: 35.0))
                                        .frame(minWidth: 0, maxWidth: 25, minHeight: 0, maxHeight: 25)
                                        .foregroundColor(Color(red: 250 / 255, green: 244 / 255, blue: 140 / 255))
                                    
                                }
                            

                            
                        }.frame(width: g.size.width/3, height: g.size.height / 10)
                        .blur(radius: self.isOpen ? 10 : 0.0)
                        .zIndex(-100)
                        
                    }
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
                        
                            }.zIndex(-100)
                            
                            
                        }.zIndex(-100)
                
            }.zIndex(-100)
            //.background(Color.blue)
                    .frame(width: g.size.width, height: g.size.height/1.07)
                    .blur(radius: self.isOpen ? 10 : 0.0)
            
                    
                    
        }
                
    }
           
            
                
            
           
}
}
           
.hiddenNavigationBarStyle()
          
        
        }
            func openMenu() {
                menuOpen.toggle()
            }
            func openWarning() {
                warningOpen.toggle()
            }
            
}


struct studentView_Previews: PreviewProvider {
    static var previews: some View {
        studentView()
    }
}


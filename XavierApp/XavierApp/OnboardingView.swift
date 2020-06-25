//
//  OnboardingView.swift
//  XavierApp
//
//  Created by Eric Li on 6/24/20.
//
import SwiftUI


//struct AppView: View {
//    @State var logoScreen = false
//
//    var body: some View {
//        return Group {
//            if logoScreen {
//                OnboardingView()
//            } else {
//                BackgroundView()
//            }
//        }
//    }
//}

struct OnboardingView: View {
    @State var logoScreen = false
    
    var body: some View {
        NavigationView{
            
            
        
        
        ZStack{
            Color
                .init(red: 132/255, green: 49/255, blue: 80/255)
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack(spacing: 10) {
                //Knight Logo and Xavier App Text
                
                Image("KnightLogo")
                    .padding()
                    //.animation(.easeIn(duration: 1.0))
                    
               
                Text("XavierApp")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40.0)
                    //.animation(.easeIn(duration: 1.0))
                
                Divider()
                NavigationLink(destination: Pages().navigationBarBackButtonHidden(true)){
                    Text("Continue")
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
                .padding()
                .accentColor(Color.white)
                .background(Capsule().fill(Color("Blue")))
                
            }}
                
                
            }
                    
        }
    }
            
    

        
    
struct Pages: View {
    @State private var step = 1
    @State var username: String = ""
    var body: some View {
        ZStack{
            Color
                .init(red: 132/255, green: 49/255, blue: 80/255)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 30){
                Text("Getting Started")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                GeometryReader { gr in
                        HStack{
                            //1st Page
                            VStack(spacing: 40){
                                Spacer().frame(height: 60)
                                Text("What is your name?                                                                        ")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 60))
                                    .padding(.leading)
                                    
                                    .multilineTextAlignment(.center)
                                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                HStack{
                                Text("  ")
                                TextField("John Lee", text: $username)
                                    .padding(10)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 200, height: nil)
                                    .frame(alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.blue, lineWidth: 1))
                                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                }
                
                            }.frame(width: gr.frame(in: .global).width)
                            //2nd page
                            VStack(spacing: 40){
                                Spacer().frame(height: 60)
                                Text("What your name?                                                                        ")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 60))
                                    .padding(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                            
                            }.frame(width: gr.frame(in: .global).width)
                            
                            //2nd page
                            VStack(spacing: 40){
                                Spacer().frame(height: 60)
                                Text("What is name?                                                                        ")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 60))
                                    .padding(.leading, 50.0)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                            
                            }.frame(width: gr.frame(in: .global).width)
                        }
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .frame(width: gr.frame(in: .global).width * 3)
                        .offset(x: self.step == 1 ? gr.frame(in: .global).width : self.step == 2 ? 0 : -gr.frame(in: .global).width)
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                        
                    }
                //1..2...3.... buttons
                HStack(spacing: 20){
                    Button(action: {
                        self.step = 1
                    }) {
                        Image(systemName: "1.circle")
                            .padding()
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    Button(action: {
                        self.step = 2
                    }) {
                        Image(systemName: "2.circle")
                            .padding()
                            .scaleEffect(step == 2 ? 1 : 0.65)
                    }
                    Button(action: {
                        self.step = 3
                    }) {
                        Image(systemName: "3.circle")
                            .padding()
                            .scaleEffect(step == 3 ? 1 : 0.65)
                    }
                    
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color.white)
                
                Button(action: {
                    //Connection to main view
                }){
                    HStack{
                        Text("Continue")
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                    .padding()
                    .accentColor(Color.white)
                    .background(Capsule().fill(Color("Blue")))
                    .opacity(step == 3 ? 1 : 0)
                    .animation(.none)
                    .scaleEffect(step == 3 ? 1 : 0.01)
                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

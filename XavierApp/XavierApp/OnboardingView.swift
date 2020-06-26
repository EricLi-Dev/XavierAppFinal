//
//  OnboardingView.swift
//  XavierApp
//
//  Created by Eric Li on 6/24/20.
//
import SwiftUI


struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

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
                NavigationLink(
                    destination: PageOne()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)){
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
    
            
    

        
    
struct PageOne: View {
    @State var username: String = ""
    @State var parent = false
    @State var student = false
    var body: some View {
    NavigationView{
            
    VStack{
                        
        ZStack(){
                //Background Color
                ZStack{
                Color
                    .init(red: 132/255, green: 49/255, blue: 80/255)
                    .edgesIgnoringSafeArea(.all)
                }
                
<<<<<<< HEAD
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
                                    .animation(Animation.interpolatingSpring( stiffness: 10, damping: 30, initialVelocity: 5).delay(0.1))
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
                                    .animation(Animation.interpolatingSpring( stiffness: 10, damping: 30, initialVelocity: 5).delay(0.1))
                                }
=======
>>>>>>> 413bda027d626e5258092423171df645af73b8f4
                
            GeometryReader { gr in
                VStack{
                    //1st Page
                    ZStack{
                        Text("Getting Started")
                            .bold()
                            //.position(x: 210, y: -100)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            
                        }
                        //.background(Color.pink)
                        .frame(width: gr.size.width, height: gr.size.height/4)
                        Divider()
                        Divider()
                    
                       
                            
                    ZStack(){
                        VStack(spacing: 30){
                        Text("What is your name?")
                            .foregroundColor(Color.white)
                            .font(.system(size: 40))
                            .padding(10)
                            //.position(x: 180, y: -80)
                            .multilineTextAlignment(.center)
                            .animation(Animation.interpolatingSpring( stiffness: 10, damping: 30, initialVelocity: 5).delay(0.1))
                               
                                
                        TextField("John Lee", text: $username)
                            .foregroundColor(.black)//Black Text
                            .padding(10)
                            .border(Color("Blue"))
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: nil)
                            .frame(alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .foregroundColor(.white)//White Background
                            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("Blue"), lineWidth: 1))
                            //.position(x: 180, y: -40)
                            
                            .animation(Animation.interpolatingSpring( stiffness: 10, damping: 30, initialVelocity: 5).delay(0.1))
                            
                            Divider()
                            Divider()
                            
                        }
                       
                            }
                            //.background(Color.purple)
                            .frame(width: gr.size.width, height: gr.size.height/3)
                    
                    ZStack{
                            
                        //1..2...3.... buttons
                        HStack(){
                            Button(action: {
                                 
                            }) {
                                Image(systemName: "1.circle")
                                    .padding()
                                    .scaleEffect(1)
                            }
                            Button(action: {
                                   
                            }) {
                                Image(systemName: "2.circle")
                                    .padding()
                                    .scaleEffect(0.65)
                            }
                            Button(action: {
                                   
                            }) {
                                Image(systemName: "3.circle")
                                    .padding()
                                    .scaleEffect(0.65)
                            }
                                
                        }
                        .animation(.spring(response: 0.4, dampingFraction: 0.5))
                        .font(.largeTitle)
                        .accentColor(Color.white)
                    }
                    //.background(Color.red)
                    .frame(width: gr.size.width, height: gr.size.height/4)
                    
                    ZStack{
                        //Next Button
                        NavigationLink(destination: PageTwo().navigationBarBackButtonHidden(true)){
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .padding()
                        .accentColor(Color.white)
                        .background(Capsule().fill(Color("Blue")))
                        .opacity(1)
                        .animation(.none)
                        .scaleEffect(1)
                        //.position(x: 210, y: 100)
                        .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                
                    }
                    //.background(Color.green)
                    .frame(width: gr.size.width, height: gr.size.height/25)
                            
                }
                
                
                        
                        
                        
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .hiddenNavigationBarStyle()
            
            
               
               
                  
            }
                
        }
    }
}
}



struct PageTwo: View {
    @State var parent = false
    @State var student = false
    
    var body: some View {
        NavigationView{
            
            ZStack{
                //sets background color to Maroon
                Color
                    .init(red: 132/255, green: 49/255, blue: 80/255)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack(){
                    Text("Getting Started")
                        .bold()
                        .position(x: 210, y: -195)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    GeometryReader { gr in
                            HStack{
                                //Parent or Student Page
                                VStack(){
                                    Text("I am a")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 60))
                                        .padding(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .position(x: 200, y: -250)
                                        .multilineTextAlignment(.center)
                                        .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
                                    VStack{
                                    Button(action: {
                                        self.parent.toggle()
                                    }) {
                                        Text("Parent")
                                            .padding()
                                    }.animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
                                    
                                    Button(action: {
                                        self.student.toggle()
                                    }) {
                                        Text("Student")
                                            .padding()
                                    }.animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
                                    }
                                    .position(x: 200, y: -250)
                    
                                }
                            }
                    
                }
                
            }
            .multilineTextAlignment(.center)
            .foregroundColor(Color.white)
            .font(.title)
            //.frame(width: gr.frame(in: .global).width * 3)
            .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7))
                
                Divider()
                
                //1..2...3.... buttons
                HStack(spacing: 20){
                    Button(action: {
                        
                    }) {
                        Image(systemName: "1.circle")
                            .padding()
                            .scaleEffect(0.65)
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "2.circle")
                            .padding()
                            .scaleEffect(1)
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "3.circle")
                            .padding()
                            .scaleEffect(0.65)
                    }
                    
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color.white)
                .position(x: 210, y: 150)
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color.white)
            
            NavigationLink(destination: PageThree().navigationBarBackButtonHidden(true)){
                Text("Next")
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal)
            .padding()
            .accentColor(Color.white)
            .background(Capsule().fill(Color("Blue")))
            .opacity(1)
            .animation(.none)
            .scaleEffect(1)
            .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
        }
    }
}
}

struct PageThree: View {
    var body: some View {
        NavigationView{
            
            ZStack{
                //sets background color to Maroon
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
                                //CameraView Page
                                VStack(spacing: 40){
                                    
                                    Text("Camera View Page")
                                                                    
                    
                                }
                            }
                    
                }
                
            }
        
                //1..2...3.... buttons
                HStack(spacing: 20){
                    Button(action: {
                        
                    }) {
                        Image(systemName: "1.circle")
                            .padding()
                            .scaleEffect(0.65)
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "2.circle")
                            .padding()
                            .scaleEffect(0.65)
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "3.circle")
                            .padding()
                            .scaleEffect(1)
                    }
                    
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color.white)
            
            NavigationLink(
                //Change destination to Main View
                destination:
                PageOne().navigationBarBackButtonHidden(true)){
                Text("Continue")
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal)
            .padding()
            .accentColor(Color.white)
            .background(Capsule().fill(Color("Blue")))
            .opacity(1)
            .animation(.none)
            .scaleEffect(1)
            .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
            
        }
    }
}
}




struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


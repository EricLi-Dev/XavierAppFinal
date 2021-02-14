//
//  OnboardingView.swift
//  XavierApp
//
//  Created by Eric Li on 6/24/20.
//
import SwiftUI
import Vision
import VisionKit
import WebKit
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}

struct OnboardingView: View {
    @ObservedObject var userSettings = UserSettings()
    @State var logoScreen = false
   

    var body: some View {
        NavigationView {
            
                    // START FORMAT HERE
                    ZStack {
                        onboardOneBack()
                        VStack{
                            logoOnOne()
                                .offset(x:0,y:-75)
                            GeometryReader { comb in
                            ZStack{
                                purpbleCircle()
                                VStack {
                                   
                                    Text("Welcome")
                                        .font(.system(size: comb.size.height > comb.size.width ? comb.size.width * 0.075: comb.size.height * 0.075, weight: .medium, design: .rounded))
                                        .foregroundColor(Color.white)
                                        .padding(.bottom, 3)
                                        .padding(.top)
                                    

                                    Text("You're on your way to getting the latest\n on what’s happening at Xavier.")
                                        .font(.system(size: comb.size.width * 0.0475, weight: .light, design: .rounded))
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, comb.size.height*0.02)

                                        .foregroundColor(Color.white)
                                    NavigationLink(
                                        destination: PageOne()
                                            .navigationBarBackButtonHidden(true)
                                            .navigationBarTitle("")
                                            .navigationBarHidden(true)) {
                                        Text("Parents")
                                            .font(.system(size: comb.size.height > comb.size.width ? comb.size.width * 0.065: comb.size.height * 0.065, weight: .regular, design: .rounded))
                                            .foregroundColor(Color.white)
                                    }
                                    .frame(width: comb.size.width*0.45, height: comb.size.height/9.5, alignment: .center)

                                    .background(Capsule().fill(Color.black.opacity(0)))

                                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                                    .padding(.bottom)
                                    .padding(.top)
                                   
                                    
                                    NavigationLink(
                                        destination: PageOne()
                                            .navigationBarBackButtonHidden(true)
                                            .navigationBarTitle("")
                                            .navigationBarHidden(true)) {
                                        Text("Students")
                                            .font(.system(size: comb.size.height > comb.size.width ? comb.size.width * 0.065: comb.size.height * 0.065, weight: .regular, design: .rounded))
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    .frame(width: comb.size.width*0.45, height: comb.size.height/9.5, alignment: .center)

                                    .background(Capsule().fill(Color.black.opacity(0)))

                                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                                    
                        //                                }.offset(x: 0.0, y: -(g.size.height / 2.2))
                                
                                }
                                    .offset(x:0,y:-(comb.size.height/2))
                            }
                            .offset(x: 0, y: comb.size.height/1.5)
                            }
                        }
                        
                    }
                }
                // Knight Logo and Xavier App Text
           
    }
}

struct PageOne: View {
    @ObservedObject var userSettings = UserSettings()
    @State var username: String = ""
    @State var isOpen = false
    @State var parent = false
    @State var student = false
    
    var body: some View {
        NavigationView {
            GeometryReader{ comb in
            ZStack {
                Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Great!")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)

                    Text("Now, we want to make your experience with the app more tailored to you.\n \nIf you have a PlusPortals login, \nplease sign in now.")
                        .font(.system(size: 25, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, comb.size.height/20)
//                    TextField("Tyler Wing Wong", text: $userSettings.name)
//                        .foregroundColor(.black) // Black Text
//                        .padding(10)
//                        .border(Color("Blue"))
//                        .multilineTextAlignment(.center)
//
//                        .background(Capsule())
//                        .foregroundColor(.white) // White Background
//                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("Blue"), lineWidth: 1))
                    // .position(x: 180, y: -40)
                    
                    NavigationLink(
                        destination:  ContentView()
                    
                            
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)) {
                        Text("Sign in with Plus Portals ")
                            .font(.system(size: 22, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                        
                        
                    }
                    .frame(height: comb.size.height/13, alignment: .center)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    .padding(.top, comb.size.height/5)
                    NavigationLink(
                        destination: PageTwo()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)) {
                        Text("Skip")
                            .font(.system(size: 22, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.top)
                    }
                    .padding(.horizontal)
                    .padding()
                    .accentColor(Color.white)
                    
                }.hiddenNavigationBarStyle()
            }
            
            }
        }
    }
}

struct PageTwo: View {
    
    @ObservedObject var userSettings = UserSettings()
    @State var username: String = ""
    @State var isOpen = false
    @State var parent = false
    @State var student = false
   
    var body: some View {
        NavigationView {
            GeometryReader{ comb in
            ZStack {
                Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("One more thing...")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)

                    Text("Since you are a student, \nsign in with your school \nGoogle account to keep track\nof your assignments.")
                        .font(.system(size: 25, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, comb.size.height/10)
//                    TextField("Tyler Wing Wong", text: $userSettings.name)
//                        .foregroundColor(.black) // Black Text
//                        .padding(10)
//                        .border(Color("Blue"))
//                        .multilineTextAlignment(.center)
//
//                        .background(Capsule())
//                        .foregroundColor(.white) // White Background
//                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("Blue"), lineWidth: 1))
                    // .position(x: 180, y: -40)
//                    NavigationLink(
//                        destination: PageTwo()
//                            .navigationBarBackButtonHidden(true)
//                            .navigationBarTitle("")
//                            .navigationBarHidden(true)) {
//                        Text("Sign in with Google")
//                            .font(.system(size: 22, weight: .regular, design: .rounded))
//                            .foregroundColor(Color.white)
//                            .padding(.horizontal)
//
//                    }
                 
                    Button(action: {
                        if GIDSignIn.sharedInstance()?.currentUser != nil {
                            GIDSignIn.sharedInstance()?.signOut()
                           
                        } else {
//                            GIDSignIn.sharedInstance().delegate = UIApplication.shared.windows.first?.rootViewController
                            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                            GIDSignIn.sharedInstance().scopes = [ kGTLRAuthScopeClassroomCourses, kGTLRAuthScopeClassroomCourseworkMe, kGTLRAuthScopeClassroomCourseworkStudents]
                            GIDSignIn.sharedInstance()?.signIn()
                        }
                        }) {
                        Text("Sign in with Google")
                                                   .font(.system(size: 22, weight: .regular, design: .rounded))
                                                   .foregroundColor(Color.white)
                                                   .padding(.horizontal)
                        }   .frame(height: comb.size.height/13, alignment: .center)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    .padding(.top, comb.size.height/5)
                    NavigationLink(
                        destination: PageThree()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)) {
                        Text("Skip")
                            .font(.system(size: 22, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.top)
                    }
                    .padding(.horizontal)
                    .padding()
                    .accentColor(Color.white)
                    
                }.hiddenNavigationBarStyle()
            }
            
            }
        }
    
    }
}

struct PageThree: View {
    @ObservedObject var userSettings = UserSettings()
    @State var username: String = ""
    @State var isOpen = false
    @State var parent = false
    @State var student = false
    let service = GTLRClassroomService()
    var body: some View {
        NavigationView {
            GeometryReader{ comb in
            ZStack {
                Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("One more thing...")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)

                    Text("Now, we want to make your \nexperience with the app \nmore tailored to you. \n \nPlease enter your name.")
                        .font(.system(size: 25, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, comb.size.height/10)
                        .padding(.bottom, comb.size.height/10)
//                    TextField("Tyler Wing Wong", text: $userSettings.name)
//                        .foregroundColor(.black) // Black Text
//                        .padding(10)
//                        .border(Color("Blue"))
//                        .multilineTextAlignment(.center)
//
//                        .background(Capsule())
//                        .foregroundColor(.white) // White Background
//                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("Blue"), lineWidth: 1))
                    // .position(x: 180, y: -40)
                        
                        
//                    NavigationLink(
//                        destination: PageTwo()
//                            .navigationBarBackButtonHidden(true)
//                            .navigationBarTitle("")
//                            .navigationBarHidden(true)) {
//                        Text("Sign in with Google")
//                            .font(.system(size: 22, weight: .regular, design: .rounded))
//                            .foregroundColor(Color.white)
//                            .padding(.horizontal)
//
//                    }
                    VStack{
                    HStack{
                        TextField("Johnny Appleseed", text: $username)
                            .font(.system(size: 23))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                        
                            
                    }
                    .padding(12)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .cornerRadius(35)
                    }.padding(.horizontal, 55)
                    Button(action: {
                        if let user = GIDSignIn.sharedInstance()?.currentUser {
                            self.service.authorizer = user.authentication.fetcherAuthorizer()
                        let drive = CloudFilesManager(service)
                        print("HERE")
                        let ok = drive.googleClassroomList()
                        print(ok)
                            
                        }
                    }) {
                        Text("Helllooooo")
                    }
                    NavigationLink(
                        destination: MotherView()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)) {
                        Text("Continue")
                            .font(.system(size: 22, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.top, comb.size.height/5)
                    }
                    .padding(.horizontal)
                    .padding()
                    .accentColor(Color.white)
                    
                }.hiddenNavigationBarStyle()
            }
            
            }
        }
    
    }
}

// struct PageTwo: View {
//     @ObservedObject var userSettings = UserSettings()

//     var body: some View {
//         NavigationView {
//             VStack {
//                 ZStack {
//                     // Background Color
//                     ZStack {
//                         Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255)
//                             .edgesIgnoringSafeArea(.all)
//                     }

//                     GeometryReader { gr in
//                         VStack {
//                             // 2nd Page
//                             ZStack {
//                                 Text("Getting Started")
//                                     .bold()
//                                     // .position(x: 210, y: -100)
//                                     .font(.largeTitle)
//                                     .foregroundColor(.white)
//                             }
//                             // .background(Color.purple)
//                             .frame(width: gr.size.width, height: gr.size.height / 4)
//                             Divider()
//                             Divider()

//                             ZStack {
//                                 VStack {
// //                                VStack{
// //                                    Text("I am a")
// //                                        .foregroundColor(Color.white)
// //                                        .font(.system(size: 60))
// //                                        .padding(.leading)
// //                                        .fixedSize(horizontal: false, vertical: true)
// //                                        .multilineTextAlignment(.center)
// //                                        .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
// //
// //                                }
// //
//                                     VStack {
//                                         Button(action: {
//                                             UserDefaults.standard.set(true, forKey: "isParent")
//                                             UserDefaults.standard.set(false, forKey: "isStudent")

//                                             // UserDefaults.standard.set(true, forKey: "viewSwitch")
//                                         }) {
//                                             Text("Parent")
//                                         }
//                                         .padding(.horizontal)
//                                         .padding()
//                                         .accentColor(Color.white)
//                                         .background(Capsule().fill(Color("Blue")))
//                                         .opacity(1)
//                                         .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))

//                                         .padding()

//                                         Button(action: {
//                                             UserDefaults.standard.set(false, forKey: "isParent")
//                                             UserDefaults.standard.set(true, forKey: "isStudent")
//                                         }) {
//                                             Text("Student")
//                                         }
//                                         .padding(.horizontal)
//                                         .padding()
//                                         .accentColor(Color.white)
//                                         .background(Capsule().fill(Color("Blue")))
//                                         .opacity(1)
//                                         .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
//                                     }
//                                 }
//                             }
//                             // .background(Color.pink)
//                             .frame(width: gr.size.width, height: gr.size.height / 3)

//                             VStack {
//                                 ZStack {
//                                     // 1..2...3.... buttons
//                                     HStack {
//                                         Button(action: {}) {
//                                             Image(systemName: "1.circle")
//                                                 .padding()
//                                                 .scaleEffect(0.65)
//                                         }
//                                         Button(action: {}) {
//                                             Image(systemName: "2.circle")
//                                                 .padding()
//                                                 .scaleEffect(1)
//                                         }
//                                         Button(action: {}) {
//                                             Image(systemName: "3.circle")
//                                                 .padding()
//                                                 .scaleEffect(0.65)
//                                         }
//                                     }
//                                     .animation(.spring(response: 0.4, dampingFraction: 0.5))
//                                     .font(.largeTitle)
//                                     .accentColor(Color.white)
//                                 }
//                             }
//                             // .background(Color.red)
//                             .frame(width: gr.size.width, height: gr.size.height / 4)

//                             ZStack {
//                                 // Next Button
//                                 NavigationLink(
//                                     destination: PageThree()
//                                         .navigationBarBackButtonHidden(true)
//                                         .navigationBarTitle("")
//                                         .navigationBarHidden(true)) {
//                                     Text("Next")
//                                     Image(systemName: "chevron.right")
//                                 }
//                                 .padding(.horizontal)
//                                 .padding()
//                                 .accentColor(Color.white)
//                                 .background(Capsule().fill(Color("Blue")))
//                                 .opacity(1)
//                                 .animation(.none)
//                                 .scaleEffect(1)
//                                 // .position(x: 210, y: 100)
//                                 .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
//                             }
//                             // .background(Color.green)
//                             .frame(width: gr.size.width, height: gr.size.height / 30)
//                         }
//                         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
//                         .hiddenNavigationBarStyle()
//                     }
//                 }
//             }
//         }
//     }
// }

// struct PageThree: View {
//     @ObservedObject var userSettings = UserSettings()

//     @State private var recognizedText = ""
//     @State private var progressText = ""

//     @State private var showingScanningView = false
//     var body: some View {
//         NavigationView {
//             VStack {
//                 ZStack {
//                     // Background Color
//                     ZStack {
//                         Color(red: 132 / 255, green: 49 / 255, blue: 80 / 255)
//                             .edgesIgnoringSafeArea(.all)
//                     }

//                     GeometryReader { gr in
//                         VStack {
//                             // 2nd Page
//                             ZStack {
//                                 Text("Getting Started")
//                                     .bold()
//                                     // .position(x: 210, y: -100)
//                                     .font(.largeTitle)
//                                     .foregroundColor(.white)
//                             }
//                             // .background(Color.purple)
//                             .frame(width: gr.size.width, height: gr.size.height / 4)
//                             Divider()
//                             Divider()

//                             ZStack {
//                                 VStack {
//                                     ZStack {
//                                         RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                             .fill(Color.gray.opacity(0.2))

//                                         Text(recognizedText)
//                                             .padding()
//                                             .fixedSize(horizontal: 1000 != 0, vertical: 1000 != 0)
//                                     }
//                                     // comment
//                                 }
//                             }
//                             // .background(Color.pink)
//                             .frame(width: gr.size.width, height: gr.size.height / 3)

//                             VStack {
//                                 ZStack {
//                                     // 1..2...3.... buttons
//                                     HStack {
//                                         Button(action: {}) {
//                                             Image(systemName: "1.circle")
//                                                 .padding()
//                                                 .scaleEffect(0.65)
//                                         }
//                                         Button(action: {}) {
//                                             Image(systemName: "2.circle")
//                                                 .padding()
//                                                 .scaleEffect(0.65)
//                                         }
//                                         Button(action: {}) {
//                                             Image(systemName: "3.circle")
//                                                 .padding()
//                                                 .scaleEffect(1)
//                                         }
//                                     }
//                                     .animation(.spring(response: 0.4, dampingFraction: 0.5))
//                                     .font(.largeTitle)
//                                     .accentColor(Color.white)
//                                 }
//                             }
//                             // .background(Color.red)
//                             .frame(width: gr.size.width, height: gr.size.height / 4)

//                             ZStack {
//                                 // Next Button
//                                 NavigationLink(destination: MotherView().navigationBarBackButtonHidden(true)) {
//                                     Text("Next")
//                                     Image(systemName: "chevron.right")
//                                 }
//                                 .padding(.horizontal)
//                                 .padding()
//                                 .accentColor(Color.white)
//                                 .background(Capsule().fill(Color("Blue")))
//                                 .opacity(1)
//                                 .animation(.none)
//                                 .scaleEffect(1)
//                                 // .position(x: 210, y: 100)
//                                 .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
//                             }
//                             // .background(Color.green)
//                             .frame(width: gr.size.width, height: gr.size.height / 25)
//                         }
//                         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
//                         .hiddenNavigationBarStyle()
//                     }
//                 }
//             }
//         }
//     }
// }

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
        }
    }
}

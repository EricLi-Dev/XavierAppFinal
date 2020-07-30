//
//  OnboardingView.swift
//  XavierApp
//
//  Created by Eric Li on 6/24/20.
//
import SwiftUI
import VisionKit
import Vision


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

struct ScanDocumentView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var recognizedText: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedText: $recognizedText, parent: self)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentViewController = VNDocumentCameraViewController()
        documentViewController.delegate = context.coordinator
        return documentViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        //to implement
    }
    
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        var recognizedText: Binding<String>
        var parent: ScanDocumentView
        
        init(recognizedText: Binding<String>, parent: ScanDocumentView){
            self.recognizedText = recognizedText
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan){
            let extractedImages = extractImages(from: scan)
            let processedText = recognizeText(from: extractedImages)
            recognizedText.wrappedValue = processedText
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        fileprivate func extractImages(from scan: VNDocumentCameraScan) -> [CGImage]{
            var extractedImages = [CGImage]()
            for index in 0..<scan.pageCount {
                let extractedImage = scan.imageOfPage(at: index)
                guard let cgImage = extractedImage.cgImage else { continue }
                
                extractedImages.append(cgImage)
            }
            return extractedImages
        }
        
        
        fileprivate func recognizeText(from images: [CGImage]) -> String {
            var entireRecognizedText = ""
            let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
                guard error == nil else { return }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
                
                let maximumRecognitionCandidates = 1
                for observation in observations {
                    guard let candidate = observation.topCandidates(maximumRecognitionCandidates).first else { continue }
                    
                    entireRecognizedText += "\(candidate.string)\n"
                    
                }
            }
            
            recognizeTextRequest.recognitionLevel = .accurate
            recognizeTextRequest.usesLanguageCorrection = true
            recognizeTextRequest.revision = VNRecognizeTextRequestRevision2

            recognizeTextRequest.customWords = ["2019"]
            recognizeTextRequest.minimumTextHeight = 0.3//Text bigger than 30% of the image height
//            recognizeTextRequest.progressHandler = {
//
//            }

            
            for image in images {
                let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
                
                try? requestHandler.perform([recognizeTextRequest])
            }
            
            return entireRecognizedText
        }
        
    }
        
}


struct OnboardingView:
    View {
    
    @ObservedObject var userSettings = UserSettings()
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
                    
               
                Text("")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(40.0)
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
    @ObservedObject var userSettings = UserSettings()
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
                               
                                
                            TextField("Tyler Wing Wong", text: $userSettings.name)
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
                        NavigationLink(
                            destination: PageTwo()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)){
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
    @ObservedObject var userSettings = UserSettings()
    
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
                        
                        
                    GeometryReader { gr in
                        VStack{
                            //2nd Page
                            ZStack{
                                Text("Getting Started")
                                    .bold()
                                    //.position(x: 210, y: -100)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    
                                }
                                //.background(Color.purple)
                                .frame(width: gr.size.width, height: gr.size.height/4)
                                Divider()
                                Divider()
                            
                               
                                    
                            ZStack(){
                                VStack{
//                                VStack{
//                                    Text("I am a")
//                                        .foregroundColor(Color.white)
//                                        .font(.system(size: 60))
//                                        .padding(.leading)
//                                        .fixedSize(horizontal: false, vertical: true)
//                                        .multilineTextAlignment(.center)
//                                        .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
//
//                                }
//
                                VStack{
                                    Button(action: {
                                        UserDefaults.standard.set(true, forKey: "isParent")
                                        UserDefaults.standard.set(false, forKey: "isStudent")
                                        
                                        //UserDefaults.standard.set(true, forKey: "viewSwitch")
                                    }) {
                                        Text("Parent")
                                            
                                    }
                                    .padding(.horizontal)
                                    .padding()
                                    .accentColor(Color.white)
                                    .background(Capsule().fill(Color("Blue")))
                                    .opacity(1)
                                    .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
                                    
                                    .padding()
                                    
                                    Button(action: {
                                        UserDefaults.standard.set(false, forKey: "isParent")
                                    UserDefaults.standard.set(true, forKey: "isStudent")
                                    }) {
                                        Text("Student")
                                        
                                    }
                                    .padding(.horizontal)
                                    .padding()
                                    .accentColor(Color.white)
                                    .background(Capsule().fill(Color("Blue")))
                                    .opacity(1)
                                    .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
                               
                                    }
                                    
                                }
                            }
                                //.background(Color.pink)
                                .frame(width: gr.size.width, height: gr.size.height/3)
                           
                            VStack{
                            ZStack{
                                    
                                //1..2...3.... buttons
                                HStack(){
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
                            }
                            }
                            //.background(Color.red)
                            .frame(width: gr.size.width, height: gr.size.height/4)
                            
                            ZStack{
                                //Next Button
                                NavigationLink(
                                    destination: PageThree()
                                        .navigationBarBackButtonHidden(true)
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)){
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
                            .frame(width: gr.size.width, height: gr.size.height/30)
                                    
                        
                        
                        
                                
                                
                                
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .hiddenNavigationBarStyle()
                    
                    
                       
                       
                          
                    }
                        
                }
            
    }
}
}


struct PageThree: View {
    @ObservedObject var userSettings = UserSettings()

    @State private var recognizedText = ""
    @State private var progressText = ""

    @State private var showingScanningView = false
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
                        
                        
                    GeometryReader { gr in
                        VStack{
                            //2nd Page
                            ZStack{
                                Text("Getting Started")
                                    .bold()
                                    //.position(x: 210, y: -100)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    
                                }
                                //.background(Color.purple)
                                .frame(width: gr.size.width, height: gr.size.height/4)
                                Divider()
                                Divider()
                            
                               
                                    
                            ZStack(){
                                VStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Color.gray.opacity(0.2))
                                        
                                        Text(recognizedText)
                                            .padding()
                                            .fixedSize(horizontal: (1000 != 0),vertical: (1000 != 0))
                                        
                                    }
                                    //comment
                                    Button(action: {
                                        self.showingScanningView = true
                                    }) {
                                        Image(systemName: "camera")
                                            .padding(.horizontal)
                                            .padding()
                                            .accentColor(Color.white)
                                            .background(Capsule().fill(Color("Blue")))
                                            .opacity(1)
                                            .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))
                                            
                                    }
                                    
                                }.sheet(isPresented: $showingScanningView) {
                                    ScanDocumentView(recognizedText: self.$recognizedText)
                                   
                                    
                                }
                                
                                
                            }
                                //.background(Color.pink)
                                .frame(width: gr.size.width, height: gr.size.height/3)
                           
                            VStack{
                            ZStack{
                                    
                                //1..2...3.... buttons
                                HStack(){
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
                            }
                            }
                            //.background(Color.red)
                            .frame(width: gr.size.width, height: gr.size.height/4)
                            
                            ZStack{
                                //Next Button
                                NavigationLink(destination: MotherView().navigationBarBackButtonHidden(true)){
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
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .hiddenNavigationBarStyle()
                    
                    
                       
                       
                          
                    }
                        
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

}

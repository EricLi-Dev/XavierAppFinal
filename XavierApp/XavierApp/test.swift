////
////  test.swift
////  XavierApp
////
////  Created by Eric Li on 7/24/20.
////
//
//import SwiftUI
//
//struct pageFourTest: View{
//    
//    @ObservedObject var sched = schedData()
//    @State private var textLetterDay = 0
//    @State private var showSheet = false
//    @State var subjectName = ""
//    @State var subjectTeacher = ""
//    @State var subjectTime = ""
//    @State private var selected: Int = 0
//    
//    var body: some View{
//        ZStack{
//            GeometryReader{ g in
//                VStack{
//                ScrollView(.horizontal){
//                   
//                        //LetterDay text
//                        HStack(alignment: .center){
//                            Spacer()
//                                .frame(width:  g.size.width/3)
//                        
//                            Button(action: {
//                                self.textLetterDay = 0
//                            }) {
//                                Text("A")
//                                    
//                            }
//                            
////                            Text("A")
////                                .padding(10)
////                                .background(Color("Blue"))
////                                .clipShape(RoundedRectangle (cornerRadius: 6))
//                            
//                            Button(action: {
//                                self.textLetterDay = 1
//                            }) {
//                                Text("B")
//                                    
//                            }
//                            Button(action: {
//                                self.textLetterDay = 2
//                            }) {
//                                Text("C")
//                                    
//                            }
//                            Button(action: {
//                                self.textLetterDay = 3
//                            }) {
//                                Text("D")
//                                    
//                            }
//                            Button(action: {
//                                self.textLetterDay = 4
//                            }) {
//                                Text("E")
//                                    
//                            }
//                            Button(action: {
//                                self.textLetterDay = 5
//                            }) {
//                                Text("F")
//                                    
//                            }
//                            Button(action: {
//                                self.textLetterDay = 6
//                            }) {
//                                Text("G")
//                                    
//                            }
//                            Button(action: {
//                                self.textLetterDay = 7
//                            }) {
//                                Text("H")
//                                    
//                            }
//                           
//                           
//                        }
//                        
//                }
//                        
//                        //Schedule Editing
//                        List{
//                            
//                            if (textLetterDay < 6){
//                                        ForEach(1 ..< 7){ i in
//                                            Button(action: {
//                                                
//                                                self.selected = i
//                                                self.showSheet = true
//                                               
//                                                print(sched.Data)
//                                            }){
//                                            HStack{
//                                                Spacer()
//                                                    .frame(width: g.size.width/5.5, height: g.size.height/15)
//                                                
//                                                HStack{
//                                                    VStack(alignment: .leading){
//                                                        
//                                                        Text(sched.Data[textLetterDay][i])
//                                                        
//                                                        Text(sched.Teacher[i])
//                                                        
//                                                    }
//                                                    .fixedSize()
//                                                    .frame(width: g.size.width/5)
//                                                    Spacer()
//                                                        .frame(width: g.size.width/6)
//                                                
//                                                    HStack{
//                                                        Text(sched.TimeNormal[i])
//                                                    }
//                                                    .fixedSize()
//                                                    .frame(width: g.size.width/5)
//                                                }
//                                                .background(RoundedRectangle(cornerRadius: 4)
//                                                    .fill(Color("Blue"))
//                                                    .frame(width: g.size.width/1.2)
//                                                    .frame(height: g.size.height/15)
//                                                    .edgesIgnoringSafeArea(.horizontal))
//                                        }
//                                        
//                                    }
//                                }
//                            } else {
//                                Text(sched.Data[textLetterDay][0])
//                                Text(sched.Data[textLetterDay][1])
//                                Text(sched.Data[textLetterDay][2])
//                                Text(sched.Data[textLetterDay][3])
//                                Text(sched.Data[textLetterDay][4])
//                            }
//                                
//                                
//                                
//                                
//                            
//                    }
//                    .sheet(isPresented: $showSheet){
//                        VStack{
//                        
//                            Button(action: {
//                                sched.update(lDay: textLetterDay, pNum: selected, name: subjectName, teacher: subjectTeacher, time: subjectTime)
//                                print(sched.Data)
//                            }) {
//                                Text("Save")
//                            }
//                            
//                            List{
//                                HStack{
//                                    Text("Subject: ")
//                                    TextField(sched.Data[textLetterDay][selected], text: $subjectName)
//                                }
//                                HStack{
//                                    Text("Teacher: ")
//                                    TextField(sched.Teacher[selected], text: $subjectTeacher)
//                                }
//                                HStack{
//                                    Text("Time: ")
//                                    TextField(sched.TimeNormal[selected], text: $subjectTime)
//                                }
//                                
//                            }
//                        }
//                        
//                    }
//                    
//                  
//                    
//                  
//                
//                }
//                .animation(.default)
//                .frame(width: g.size.width, height: g.size.height)
//            }
//           
//        }
//    }
//}
//
//
//struct pageFourPreviews: PreviewProvider {
//    static var previews: some View {
//        pageFourTest()
//    }
//}

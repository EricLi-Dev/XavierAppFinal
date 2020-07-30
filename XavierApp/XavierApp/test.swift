//
//  test.swift
//  XavierApp
//
//  Created by Eric Li on 7/24/20.
//

import SwiftUI

struct pageFourTest: View{
    
    @ObservedObject var sched = schedData()
    @State private var textLetterDay = 0
    @State private var showSheet = false
    @State private var selectedPeriod: Int = 5
    
    var body: some View{
        ZStack{
            GeometryReader{ g in
                VStack{
                ScrollView(.horizontal){
                   
                        //LetterDay text
                        HStack(alignment: .center){
                            Spacer()
                                .frame(width:  g.size.width/3)
                        
                            Button(action: {
                                self.textLetterDay = 0
                            }) {
                                Text("A")
                                    
                            }
                            
//                            Text("A")
//                                .padding(10)
//                                .background(Color("Blue"))
//                                .clipShape(RoundedRectangle (cornerRadius: 6))
                            
                            Button(action: {
                                self.textLetterDay = 1
                            }) {
                                Text("B")
                                    
                            }
                            Button(action: {
                                self.textLetterDay = 2
                            }) {
                                Text("C")
                                    
                            }
                            Button(action: {
                                self.textLetterDay = 3
                            }) {
                                Text("D")
                                    
                            }
                            Button(action: {
                                self.textLetterDay = 4
                            }) {
                                Text("E")
                                    
                            }
                            Button(action: {
                                self.textLetterDay = 5
                            }) {
                                Text("F")
                                    
                            }
                            Button(action: {
                                self.textLetterDay = 6
                            }) {
                                Text("G")
                                    
                            }
                            Button(action: {
                                self.textLetterDay = 7
                            }) {
                                Text("H")
                                    
                            }
                           
                           
                        }
                        
                }
                        
                        //Schedule Editing
                        List{
                            
                            if (textLetterDay < 6){
                                        ForEach(1 ..< 9){ i in
                                            Button(action: {
                                                
                                                self.selectedPeriod = i
                                                self.showSheet = true
                                                

                                            }){
                                            HStack{
                                                Spacer()
                                                    .frame(width: g.size.width/5.5, height: g.size.height/15)
                                                
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        
                                                        Text(sched.Data[textLetterDay][i])
                                                        
                                                        Text("Mr. Johnson")
                                                        
                                                    }
                                                    .fixedSize()
                                                    .frame(width: g.size.width/5)
                                                    Spacer()
                                                        .frame(width: g.size.width/6)
                                                
                                                    HStack{
                                                        Text("8:10 - 9:20")
                                                    }
                                                    .fixedSize()
                                                    .frame(width: g.size.width/5)
                                                }
                                                .background(RoundedRectangle(cornerRadius: 4)
                                                    .fill(Color("Blue"))
                                                    .frame(width: g.size.width/1.2)
                                                    .frame(height: g.size.height/15)
                                                    .edgesIgnoringSafeArea(.horizontal))
                                        }
                                        
                                    }
                                }
                            } else {
                                Text(sched.Data[textLetterDay][0])
                                Text(sched.Data[textLetterDay][1])
                                Text(sched.Data[textLetterDay][2])
                                Text(sched.Data[textLetterDay][3])
                                Text(sched.Data[textLetterDay][4])
                                Text(sched.Data[textLetterDay][5])
                            }
                            
                          
                           
                              
                                    
                            
                            
//                                    if (period.letterDay == textLetterDay){
//
//                                        Button(action: {
//
//                                            self.showSheet = true
//                                            self.selectedPeriod = period
//
//                                        }){
//                                            HStack{
//                                                Spacer()
//                                                    .frame(width: g.size.width/5.5, height: g.size.height/15)
//
//
//
//                                                    HStack{
//
//
//                                                        VStack(alignment: .leading){
//
//                                                            Text(period.periodName)
//
//                                                            Text("Mr. Johnson")
//                                                        }
//                                                        .fixedSize()
//                                                        .frame(width: g.size.width/5)
//
//                                                        Spacer()
//                                                            .frame(width: g.size.width/6)
//
//                                                        HStack{
//                                                            Text(period.timeRange)
//                                                        }
//                                                        .fixedSize()
//                                                        .frame(width: g.size.width/5)
//                                                    }
//                                                    .background(RoundedRectangle(cornerRadius: 4)
//                                                                    .fill(Color("Blue"))
//                                                                    .frame(width: g.size.width/1.2)
//                                                                    .frame(height: g.size.height/15)
//                                                                    .edgesIgnoringSafeArea(.horizontal))
//                                                }
//                                        }
//
//
//
//
//
                                    
                                
                                
                                
                                
                            
                    }
                    .sheet(isPresented: $showSheet){
                        customActionMenu(letterDay: textLetterDay, periodNumber: selectedPeriod)
                    }
                    
                  
                    
                  
                
                }
                .animation(.default)
                .frame(width: g.size.width, height: g.size.height)
            }
           
        }
    }
}

//Menu to edit the Schedule text
struct customActionMenu: View{
    @ObservedObject var sched = schedData()
    @State var letterDay: Int
    @State var periodNumber: Int
    @State var subjectName = ""
    
    var body: some View{
        VStack{
        
            Button(action: {
                sched.Data[letterDay][periodNumber] = self.subjectName
            }) {
                Text("Save")
            }
            
            List{
                HStack{
                    Text("Subject: ")
                    TextField(sched.Data[letterDay][periodNumber], text: $subjectName)
                }
                HStack{
                    Text("Teacher: ")
                    TextField(sched.Data[letterDay][periodNumber], text: $subjectName)
                }
                HStack{
                    Text("Time: ")
                    TextField(sched.Data[letterDay][periodNumber], text: $subjectName)
                }
                
            }
        }
    }
    

}

struct pageFourPreviews: PreviewProvider {
    static var previews: some View {
        pageFourTest()
    }
}

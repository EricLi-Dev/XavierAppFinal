import SwiftUI

struct cardView: View {
    var body: some View {
           
    ZStack{
//        Color
//            .init(red: 132/255, green: 49/255, blue: 80/255)
//            .edgesIgnoringSafeArea(.all)
//
//    Spacer()
//        Text("").padding()
//    Spacer()
    
    CarouselView(itemHeight: 450,
        views: [
            AnyView(Text("Lunch")),
            AnyView(Text("Schedule")),
            AnyView(Text("Calendar")),
        
        
        
        ])
    }
}
}

struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView()
    }
}


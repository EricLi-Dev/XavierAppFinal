import SwiftUI

struct cardView: View {
    var body: some View {
           
    ZStack{
        GeometryReader{ gr in
    
            CarouselView(itemHeight: gr.size.height/2,
        views: [
            AnyView(Text("Lunch")
                        .foregroundColor(.black)
                    
            
            ),
            AnyView(Text("Schedule")
                        .foregroundColor(.black)),
            AnyView(Text("Calendar")
                        .foregroundColor(.black)),
            AnyView(Text("Lunch")
                        .foregroundColor(.black)),
            AnyView(Text("Schedule")
                        .foregroundColor(.black)),
            AnyView(Text("Calendar")
                        .foregroundColor(.black)),
            AnyView(Text("Lunch")
                        .foregroundColor(.black)),
            AnyView(Text("Schedule")
                        .foregroundColor(.black)),
            AnyView(Text("Calendar")
                        .foregroundColor(.black))
        
            
        
            ])
            
            
    }
    }
}
}

struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView()
    }
}


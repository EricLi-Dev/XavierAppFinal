import SwiftUI
import WebKit
import SwiftSoup
import FeedKit

//Information for Schedule Card
struct Period: Identifiable {
    var id: Int

    let periodName: String
    let periodNumber: Int
    let timeRange: String
}

//Information for Calendar Card
struct Events: Identifiable {
    var id: Int
    let eventName: String
    let date: String
}

//Information for Misc. Card
struct MiscInfo: Identifiable {
    var id: Int

    let url: String
    let topicName: String
    let subtopicName: String
}

struct LunchCard: View {

    var lunchMainDish = "Chicken with Rice"
    var lunchSideDish = "Broccoli"

    var body: some View {
        GeometryReader { g in
            VStack {
                VStack {
                    HStack {

                    Text("")
                        .padding(10)

                    Text("Lunch")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(20)
                        .foregroundColor(Color("mediumMaroon"))
                        .font(.custom("Helvetica Neue-Medium", size: 30))
                    }
                }

                VStack {
                    HStack {

                        Text("")
                            .padding(10)

                        VStack {
                            Text("Main Dish")
                                .foregroundColor(Color("mediumMaroon"))
                                .font(.custom("Helvetica Neue-Regular", size: 25))

                            Text(lunchMainDish)
                                .foregroundColor(Color("mediumMaroon"))
                                .font(.custom("Helvetica Neue-Thin", size: 20))
                                .multilineTextAlignment(.center)

                        }
                    }
                    .padding()

                HStack {

                    Text("")
                        .padding(10)

                    Rectangle()
                        .fill(Color("Blue"))
                        .frame(width: g.size.width/1.2, height: g.size.height/300)
                        .edgesIgnoringSafeArea(         .horizontal)
                    }

                    HStack {

                        Text("")
                            .padding(10)

                        VStack {
                            Text("Side Dish")
                                .foregroundColor(Color("mediumMaroon"))
                                .font(.custom("Helvetica Neue-Regular", size: 25))

                            Text(lunchSideDish)
                                .foregroundColor(Color("mediumMaroon"))
                                .font(.custom("Helvetica Neue-Thin", size: 20))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                }

                HStack {
                    Text("")
                        .padding(10)
                    Text("🍪")

                }

            }
        }
    }
}
func getLetterDay() -> String {
    // Webscraping by TJ
   // let webScraper3 = webScrape(source: "http://www.xavierhs.org/s/81/rd16/index.aspx?sid=81&gid=1&pgid=1511")
   return "webScraper2.parseAndExecuteDay()"

}

struct ScheduleCard: View {
   // let schedule = webScrape(source: "www.plusportals.com/xavierhs").checkPlusPortals()
//    let viewer = WebView(request: URLRequest(url: URL(string: "https://plusportals.com/xavierhs")!))

    let periods: [Period] = [
        .init(id: 0, periodName: "Religion", periodNumber: 1, timeRange: "8:20 - 9:10"),
        .init(id: 1, periodName: "APUSH", periodNumber: 2, timeRange: "9:10 - 10:00"),
        .init(id: 2, periodName: "Community Period", periodNumber: 3, timeRange: "10:00 - 10:40"),
        .init(id: 3, periodName: "AP Computer Science", periodNumber: 4, timeRange: "10:40 - 11:30"),
        .init(id: 4, periodName: "Military Science", periodNumber: 5, timeRange: "11:30 - 12:20"),
        .init(id: 5, periodName: "Lunch", periodNumber: 6, timeRange: "12:20 - 1:10"),
        .init(id: 6, periodName: "AP English 11", periodNumber: 7, timeRange: "1:10 - 1:50"),
        .init(id: 7, periodName: "Calculus", periodNumber: 8, timeRange: "1:50 - 2:40")
    ]

    var body: some View {

        GeometryReader { _ in
            VStack {
//                viewer.frame(height: false ? nil : 0)
//                    .disabled(!false)

//                VStack{
//                    HStack{
//
//
//
//                    Text("Schedule")
//                        .font(.largeTitle)
//                        .fontWeight(.semibold)
//                        .padding(.leading, 50)
//                        .padding(.trailing, 60)
//                        .padding(20)
//                        .foregroundColor(Color("mediumMaroon"))
//                        .font(.custom("Helvetica Neue-Medium", size: 30))
//                    }
//                }
//
//                ScrollView(.vertical){
//                    VStack(alignment:.leading){
//                    ForEach(periods){ period in
//
//                        Text(period.periodName)
//                            .foregroundColor(Color("mediumMaroon"))
//                            .font(.custom("Helvetica Neue", size: 23))
//                            .fontWeight(.medium)
//
//                        Text("Period \(period.periodNumber): \(period.timeRange)")
//                            .foregroundColor(Color("mediumMaroon"))
//                            .font(.custom("Helvetica Neue-Thin", size: 20))
//
//                        Rectangle()
//                            .fill(Color("Blue"))
//                            .frame(width: g.size.width/1.2,             height: g.size.height/300)
//                            .edgesIgnoringSafeArea(         .horizontal)
//
//
//                    }
//                    }
//
//                }
//
//
//
//

            }
        }

    }
}

struct CalendarCard: View {

        // Do something once


//    @ObservedObject var events = UserSettings()
    
    let events: [Events] = [
        .init(id: 0, eventName: "CFX Equador", date: "June 24th 2020"),
        .init(id: 1, eventName: "CFX Equador", date: "June 24th 2020"),
        .init(id: 2, eventName: "CFX Equador", date: "June 24th 2020"),
        .init(id: 3, eventName: "CFX Equador", date: "June 24th 2020"),
        .init(id: 4, eventName: "CFX Equador", date: "June 24th 2020"),
        .init(id: 5, eventName: "CFX Equador", date: "June 24th 2020")

    ]
    
    var body: some View {
        NavigationView {
        GeometryReader { g in
            VStack {

                VStack {
                    HStack {
                        Text("Calendar")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.leading, 60)
                            .padding(.trailing, 60)
                            .padding(20)
                            .foregroundColor(Color("mediumMaroon"))
                            .font(.custom("Helvetica Neue-Medium", size: 30))
                    }
                }

                ScrollView(.vertical) {
                    VStack(alignment: .leading) {

                        ForEach(events, id: \.id) { event in
                                //Nav Link To Destination
//                                NavigationLink(
//                                    destination: EventsView(description: event.details)
//                                            .navigationBarTitle(
//                                                Text(event.eventName)
//
//                                                    )
//                                            ) {
                                    VStack(alignment: .leading) {
                                        HStack {

                                            VStack(alignment: .center) {

                                                //EventName
                                                Text(String(event.id))
                                                    .font(.custom("Helvetica Neue", size: 23))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(Color("mediumMaroon"))

                                                //Event Date
                                                Text("Testing")
                                                    .foregroundColor(Color("mediumMaroon"))
                                                    .font(.custom("Helvetica Neue-Thin", size: 20))
                                                    .foregroundColor(Color("mediumMaroon"))
                                                    .multilineTextAlignment(.center)
                                            }.multilineTextAlignment(.center)
                                            
                                            Spacer()
                                                .frame(width: 120)
                                            //Event Arrow
//                                            Image(systemName: "chevron.right")
                                        }
                                        .accentColor(Color("mediumMaroon"))

                                        Rectangle()
                                            .fill(Color("Blue"))
                                            .frame(width: g.size.width/1.2, height: g.size.height/300)
                                            .edgesIgnoringSafeArea(         .horizontal)
                                    }
//                                }
                        }
                    }

                }

            }
        }

        .navigationBarHidden(true)
    }
}
}

struct EventsView: View {
    @ObservedObject var userSettings = UserSettings()
    let description: String
    var body: some View {
        ZStack {
            GeometryReader { _ in
                ScrollView(.vertical) {
                VStack(alignment: .leading) {

//                    List{
//                        Toggle(isOn: $userSettings.viewSwitch){
//                            Text("StudentView")
//                        }
//                    }

                    Text(description)
                        .foregroundColor(Color("mediumMaroon"))
                        .font(.custom("Helvetica Neue-Thin", size: 20))
                        .padding()
                        .edgesIgnoringSafeArea(.all)

                    }
                }

            }
        }

    }
}

struct MiscCard: View {
    let miscInfo: [MiscInfo] = [
        .init(id: 0, url: "http://www.xavierhs.org/s/81/rd16/index.aspx?sid=81&gid=1&pgid=3056", topicName: "Tuition Payment", subtopicName: "Tap for More"),
        .init(id: 1, url: "https://www.google.com/", topicName: "Parent Portal", subtopicName: "Check up on"),
        .init(id: 2, url: "http://www.xavierhs.org/s/81/rd16/start.aspx", topicName: "Volunteer", subtopicName: "Support Xavier"),
        .init(id: 3, url: "http://www.xavierhs.org/s/81/rd16/start.aspx", topicName: "Documents", subtopicName: "Get forms"),
        .init(id: 4, url: "http://www.xavierhs.org/s/81/rd16/start.aspx", topicName: "Master Calendar", subtopicName: "See all events")

    ]

    @State private var showingWebView = false

    var body: some View {
        //NavigationView{
        GeometryReader { g in
            VStack {

                VStack {
                    HStack {
                        Text("Misc.")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.leading, 60)
                            .padding(.trailing, 60)
                            .padding(20)
                            .foregroundColor(Color("mediumMaroon"))
                            .font(.custom("Helvetica Neue-Medium", size: 30))
                    }
                }

                ScrollView(.vertical) {
                    VStack(alignment: .leading) {

                        ForEach(miscInfo) { misc in
                                //Nav Link To Destination
//                                NavigationLink(
//                                    destination:
//                                        WebView(url: misc.url)
//                                            .navigationBarTitle(
//                                                Text(misc.topicName)
//                                           )
//                                            )
                            Button(action: {
                                self.showingWebView = true
                            }

                            ) {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            VStack(alignment: .leading) {

                                                //MiscName
                                                //padNum = 100 - misc.topicName
                                                Text(misc.topicName)
                                                    .font(.custom("Helvetica Neue", size: 23))
                                                    .fontWeight(.medium)
                                                    .padding(.leading, 20)
                                                    .fixedSize()

                                                    //.background(Color.red)

                                                //MiscSubName
                                                Text(misc.subtopicName)
                                                    .foregroundColor(Color("mediumMaroon"))
                                                    .font(.custom("Helvetica Neue-Thin", size: 20))
                                                    .padding(.leading, 20)
                                                    .fixedSize()
                                                    .padding(.trailing, 80)
                                                    //.background(Color.blue)
                                            }

//                                            Spacer()
//                                                .frame(width: 2)

                                            //Event Arrow
                                            Image(systemName: "chevron.right")
                                        }
                                        .accentColor(Color("mediumMaroon"))

                                        Rectangle()
                                            .fill(Color("Blue"))
                                            .frame(width: g.size.width/1.2, height: g.size.height/300)
                                            .edgesIgnoringSafeArea(         .horizontal)
                                            .padding(.leading, 20)
                                    }
                                }
                            .sheet(isPresented: $showingWebView) {
                                MiscView(miscInfo: misc)
                            }
                        }
                    }

                }

            }
        }
        //.navigationBarHidden(true)

    }
}

struct MiscView: View {
    var miscInfo: MiscInfo

    var body: some View {
        VStack {
            Text("Hel;lo")
        }
    }
}

struct PPCard: View {
    @State private var showingPPView = false

    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    Text("PlusPortals")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.leading, 30)
                        .padding(.trailing, 60)
                        .padding(0)
                        .foregroundColor(Color("mediumMaroon"))
                        .font(.custom("Helvetica Neue-Medium", size: 30))
                        .fixedSize()
                }.frame(width: g.size.width, height: g.size.height/2)

            VStack {
                Button(action: {
                    self.showingPPView = true
                }) {
                    Text("Login")
                        .padding(.horizontal)
                        .padding()
                        .accentColor(Color.white)
                        .background(Capsule().fill(Color("Blue")))
                        .opacity(1)
                        .animation(Animation.interpolatingSpring(mass: 1, stiffness: 4, damping: 3, initialVelocity: 2).delay(0.1))

                }

            }
            .frame(width: g.size.width, height: g.size.height/3)
            .sheet(isPresented: $showingPPView) {
                PPView()

            }
         }
      }
    }
}

struct PPView: View {
    @ObservedObject var userSettings = UserSettings()
    var body: some View {
        VStack {
            Text("GRADES")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)

            List {
                Text("AP Computer Science: FAIL")
                Toggle(isOn: $userSettings.viewSwitch) {
                    Text("StudentView")
                }
            }
        }
    }
}

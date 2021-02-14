//
//  webScrape.swift
//  Xavier-HS
//
//  Created by Thomas Ledwith on 12/13/19.
//  Copyright © 2019 Cornette. All rights reserved.
//

import Foundation
import SwiftSoup
import FeedKit
import WebKit
import SwiftUI

class webScrape: NSObject {
    private var html: String = ""
    private var url: String

    private var day: String = ""
    private let myURL: URL
    
    var eventsList:[Events] = []
    let parser: FeedParser
    
    @ObservedObject var evento = UserSettings()

    init(source: String, name1: String) {
        url = source
        myURL = URL(string: url)!
        parser = FeedParser(URL: myURL)

    }
    init(source: String) {
        url = source
        myURL = URL(string: url)!

        parser = FeedParser(URL: myURL)

    }
    func checkPlusPortals() {

    }
    func parseAndExecuteDay() -> String {
        return "G"
    }
    
    func showHTML() {
        do {
            html = try String(contentsOf: myURL, encoding: .ascii)
            print(html)

        } catch Exception.Error(let type, let message) {
            print(type)
            print("Message: \(message)")
        } catch {
            print("error")
        }
    }

    func parseAndExecute() -> [Events] {
        // Parse asynchronously, not to block the UI.
        var events: [Events] = []
        let result = parser.parse()

            // Do your thing, then back to the Main thread
            print(result)
            switch result {
            case .success(let feed):

                // Grab the parsed feed directly as an optional rss, atom or json feed object
                //feed.rssFeed

                // Or alternatively...
                switch feed {
                case let .atom(feed):
                    print("error!")// Atom Syndication Format Feed Model
                case let .rss(feed):
                    let items = feed.items!
                    var i = 0
                    for item in items {
                        let testString = item.description!
                        let answer = self.matches(for: "\\d{2}\\/\\d{2}\\/\\d{4}", in: testString)
                        print(answer)
                        print(item.description!)
                        var date = ""
                        if answer.isEmpty {
                            date = ""
                        } else {
                            date = answer[0]
                        }
                        events.append(.init(id: i, eventName: item.title!, date: date))
                        i+=1
                    }
                case let .json(feed):
                    print("error!")// JSON Feed Model
                }

            case .failure(let error):
                print(error)
            }

        print(events)
        return events
    }
    func eventExecution(){
        var events: [Events] = []
        let result = parser.parse()

            // Do your thing, then back to the Main thread
            print(result)
            switch result {
            case .success(let feed):

                // Grab the parsed feed directly as an optional rss, atom or json feed object
                //feed.rssFeed

                // Or alternatively...
                switch feed {
                case let .atom(feed):
                    print("error!")// Atom Syndication Format Feed Model
                case let .rss(feed):
                    let items = feed.items!
                    var i = 0
                    for item in items {
                        let testString = item.description!
                        let answer = self.matches(for: "\\d{2}\\/\\d{2}\\/\\d{4}", in: testString)
                        print(answer)
                        print(item.description!)
                        var date = ""
                        if answer.isEmpty {
                            date = ""
                        } else {
                            date = answer[0]
                        }
                        events.append(.init(id: i, eventName: item.title!, date: "Dec. 24th 2020"))
                        i+=1
                    }
                case let .json(feed):
                    print("error!")// JSON Feed Model
                }

            case .failure(let error):
                print(error)
            }

        print(events)
        eventsList = events
    }
    func getEventsList() {
        print("HELL YEAH BUDDY")
        self.eventExecution()
//        evento.eventss = eventsList
    }
    func matches(for regex: String, in text: String) -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

    
}

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
    private let name: String
    private let email = "ledwitht21@nycxavierhs.org"

    let parser: FeedParser

    init(source: String, name1: String) {
        url = source
        myURL = URL(string: url)!
        name = name1
        parser = FeedParser(URL: myURL)

    }
    init(source: String) {
        url = source
        myURL = URL(string: url)!
        name = ""
        parser = FeedParser(URL: myURL)

    }
    func checkPlusPortals() {
//        webView.evaluateJavaScript("document.getElementById('UserName').value='\(email)'",
//            completionHandler: { (value, error) in
//            print(value)
//            print("ERROR \(error)")
//
//
//        })
        //WebKit(request: URLRequest(url: myURL))

    }
    func parseAndExecuteDay() -> String {
//        do {
//            html = try String(contentsOf: myURL, encoding: .ascii)
//            if html.contains("A Day") || html.contains("A day") || html.contains("A DAY") {
//                return "A"
//            } else if html.contains("B Day") || html.contains("B day") || html.contains("B DAY") {
//                return "B"
//            }else if html.contains("C Day") || html.contains("C day") || html.contains("C DAY") {
//                return "C"
//            }else if html.contains("D Day") || html.contains("D day") || html.contains("D DAY") {
//                return "D"
//            }else if html.contains("E Day") || html.contains("E day") || html.contains("E DAY") {
//                return "E"
//            }else if html.contains("F Day") || html.contains("F day") || html.contains("F DAY") {
//                return "F"
//            }else if html.contains("G Day") || html.contains("G day") || html.contains("G DAY") {
//                return "G"
//            }else if html.contains("H Day") || html.contains("H day") || html.contains("H DAY") {
//                return "H"
//            }
//
//
//
//        } catch Exception.Error(let type, let message) {
//            print(type)
//            print("Message: \(message)")
//        } catch {
//            return "error"
//        }
        return "G"
    }
    func nameCheck() {
//        do {
//            html = try String(contentsOf: myURL, encoding: .ascii)
//
//            if html.range(of: name, options: .caseInsensitive) != nil {
//                print("ON CALL DOWN!!!!")
//            } else {
//
//            }
//
//
//        } catch Exception.Error(let type, let message) {
//            print(type)
//            print("Message: \(message)")
//        } catch {
//            print("error")
//        }
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
                        events.append(.init(id: i, eventName: item.title!, date: date, details: ""))
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

    func getDay() -> String {
        return day
    }
}

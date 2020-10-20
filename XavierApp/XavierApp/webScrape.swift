//
//  webScrape.swift
//  Xavier-HS
//
//  Created by Thomas Ledwith on 12/13/19.
//  Copyright © 2019 Cornette. All rights reserved.
//

import Foundation
import SwiftSoup


class webScrape: NSObject {
    private var html: String = ""
    private var url: String
    private var one: String = ""
    private var two: String = ""
    private var three: String = ""
    private var day: String = ""
    private let myURL: URL
    private let name: String
    init(source: String, name1: String) {
        url = source
        myURL = URL(string: url)!
        name = name1
    }
    init(source: String) {
        url = source
        myURL = URL(string: url)!
        name = ""
    }
    func parseAndExecuteDay() -> String{
        do {
            html = try String(contentsOf: myURL, encoding: .ascii)
            if html.contains("A Day") || html.contains("A day") || html.contains("A DAY") {
                return "A"
            } else if html.contains("B Day") || html.contains("B day") || html.contains("B DAY") {
                return "B"
            }else if html.contains("C Day") || html.contains("C day") || html.contains("C DAY") {
                return "C"
            }else if html.contains("D Day") || html.contains("D day") || html.contains("D DAY") {
                return "D"
            }else if html.contains("E Day") || html.contains("E day") || html.contains("E DAY") {
                return "E"
            }else if html.contains("F Day") || html.contains("F day") || html.contains("F DAY") {
                return "F"
            }else if html.contains("G Day") || html.contains("G day") || html.contains("G DAY") {
                return "G"
            }else if html.contains("H Day") || html.contains("H day") || html.contains("H DAY") {
                return "H"
            }
            
            
            
        } catch Exception.Error(let type, let message) {
            print(type)
            print("Message: \(message)")
        } catch {
        }
        return "error"
    }
    func nameCheck() {
        do {
            html = try String(contentsOf: myURL, encoding: .ascii)
            
            if html.range(of: name, options: .caseInsensitive) != nil {
                print("ON CALL DOWN!!!!")
            } else {
                
            }
            
            
        } catch Exception.Error(let type, let message) {
            print(type)
            print("Message: \(message)")
        } catch {
            print("error")
        }
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
    func parseAndExecute() {
        do {
            html = try String(contentsOf: myURL, encoding: .ascii)
            let doc: Document = try SwiftSoup.parse(html)
            let elements = try doc.getAllElements()
            var firstEvent = true
            var eventNum = 0
            for element in elements {
                switch try element.className() {
                case "date-container" :
                    if firstEvent == true {
                        print("Date: \(try element.text())")
                        let parent = element.parent()
                        let midBox = parent!.parent()

                        let title = try midBox!.select("h3.title").text()
                        print(title)
                        one = "\(title) - \(try element.text())"
                        firstEvent = false
                    } else {
                        print("Date: \(try element.text())")
                        let midBox = element.parent()
                        let title = try midBox!.select("h3.title").text()
                        print(title)
                        if eventNum == 0 {
                            two = "\(title) - \(try element.text())"
                            eventNum += 1
                        } else {
                            three = "\(title) - \(try element.text())"
                        }
                    }
                    
                default:
                    let _ = 1
                }
            }
        } catch Exception.Error(let type, let message) {
            print(type)
            print("Message: \(message)")
        } catch {
            print("error")
        }
    }
    
    func getOne() -> String{
        return one
    }
    func getTwo() -> String {
        return two
    }
    func getThree() -> String{
        return three
    }
    func getDay() -> String{
        return day
    }
}

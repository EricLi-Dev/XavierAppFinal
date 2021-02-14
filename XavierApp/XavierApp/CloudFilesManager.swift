//
//  CloudFileManager.swift
//  GoogleDriveIntegration
//
//  Created by Kunal Gupta on 15/01/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

class CloudFilesManager {

    private let service: GTLRClassroomService

    init(_ service: GTLRClassroomService) {
        self.service = service

    }

    func googleClassroomList() -> [CourseWork] {
        var courses: [String] = []
        var assignments: [String] = []

        var courseWorkArray: [CourseWork] = []
            //let sharedInstance = GIDSignIn.sharedInstance()
            //let handler = sharedInstance
       // service.apiKey = "AIzaSyBOGamjhRuu45T2jT7Qa3LmtntSwgIxeqo"//
            let query = GTLRClassroomQuery_CoursesList.query()

            query.pageSize = 1000

            let classQuery = service.executeQuery(query, completionHandler: { ticket, fileList, error in
            print(ticket)
            if error != nil {
                let message = "Error: \(error?.localizedDescription ?? "")"
                print(message)
                print("Oops")
            } else {
                if let list = fileList as? GTLRClassroom_ListCoursesResponse {

                    for i in 0..<(list.courses?.count)! {
                        if list.courses![i].courseState == "ACTIVE" {
                        print("\(list.courses![i].name)")
                            courses.append("\(list.courses![i].identifier!)")
                            let queryA = GTLRClassroomQuery_CoursesCourseWorkList.query(withCourseId: list.courses![i].identifier!)
                            let courseName: String = list.courses![i].name!
                            //START
                            queryA.pageSize = 1000

                            let classQueryA = self.service.executeQuery(queryA, completionHandler: { ticket, fileList, error in
                           // print(ticket)
                            if error != nil {
                                let message = "Error: \(error?.localizedDescription ?? "")"
                                print(message)
                                print("Oops")
                            } else {
                                if let listy = fileList as? GTLRClassroom_ListCourseWorkResponse {

                                    if listy.courseWork?.count != nil {
                                    for i in 0..<(listy.courseWork?.count)! {
                                        let day: Int =  Int(listy.courseWork![i].dueDate?.day! ?? 0)
                                        let month: Int =  Int(listy.courseWork![i].dueDate?.month! ?? 0)
                                        let year: Int =  Int(listy.courseWork![i].dueDate?.year! ?? 0)
                                        let work = CourseWork(courseName, listy.courseWork![i].title!, day, month, year)
                                        courseWorkArray.append(work)
                                        print(work)
                                        
                                    }
                                    }

                                } else {
                                    print("Error: response is not a file list")
                                    print(fileList)
                                }
                                }

                        }
                        )
                        }
                    }
                    print(courseWorkArray)

                } else {
                    print("Error: response is not a file list")
                    print(fileList)
                }
                }

        }
        )
        return courseWorkArray
        }
    
}
struct CourseWork {
    var clas: String
    var work: String
    var day: Int
    var month: Int
    var year: Int
    init(_ clasp: String, _ workp: String, _ dayp: Int, _ monthp: Int, _ yearp: Int) {
        self.clas = clasp
        self.work = workp
        self.day = dayp
        self.month = monthp
        self.year = yearp
    }
}

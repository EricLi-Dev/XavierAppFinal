//
//  scheduleSummar.swift
//  XavierApp
//
//  Created by Eric Li on 7/25/20.
//

import Foundation

final class schedData: ObservableObject {

    @Published var Data = [[String]]()
    @Published var TimeNormal = [String]()
    @Published var TimeSpecial = [String]()
    @Published var Teacher = [String]()
    //let objectWillChange = PassthroughSubject<(), Never>()

    init() {

        Data = [
            ["US His.", "Mil Sci 11", "CP", "Religion11", "Lunch", "AP Phys 1", "AP Eng 11"],
            ["AP Comp Sci", "PE 11&12", "CP", "Spanish 3", "Lunch", "US His.", "Mil Sci 11", "Religion11"],
            ["Calculus", "AP Phys 1", "CP", "AP Eng 11", "AP CompSci", "Lunch", "PE 11&12", "Spanish 3"],
            ["Free", "Religion 11", "CP", "US His.", "Lunch", "AP Phys 1", "AP Eng 11", "Calculus" ],
            ["Free", "Spanish 3", "CP", "AP CompSci", "Lunch", "Mil Sci 11", "Religion 11", "Free"],
            ["AP Phys 1", "AP Eng 11", "CP", "Calculus", "Free", "Lunch", "Spanish 3", "Free"],
            ["Calculus", "CP", "US His.", "Religion 11", "Mil Sci 11"],
            ["AP Comp Sci", "CP", "AP Phys 1", "AP Eng 11", "Spanish 3"]

        ]

        TimeNormal = [
            "8:20 - 9:10",
            "9:10 - 10:00",
            "10:00 - 10:40",
            "11:30 - 12:10",
            "12:20 - 1:00",
            "1:00 - 1:50",
            "1:50 - 2:40"
        ]

        TimeSpecial = [
            "8:20 - 9:35",
            "9:35 - 10:15",
            "10:15 - 11:30",
            "11:30 - 12:10",
            "12:10 - 1:25",
            "1:25 - 2:40"
        ]

        Teacher = [
            "Mr. Stevens",
            "Ms. Gates",
            "Ms. Velazquez",
            "Ms. Woody",
            "LTC Kelly",
            "Mr. Duffell",
            "Ms. Woody",
            "Ms. Willert",
            "Mr. Vargas",
            "Ms. Gannon"
        ]

      /*
        [Letter Days],
        [ClassName],
        [TeacherName],
        [TimeRange],
        [ClassName],
        ...Repeat
           */

    }

    func update(lDay: Int, pNum: Int, name: String, teacher: String, time: String) {

        Data[lDay][pNum] = name
        TimeNormal[pNum] = time
        Teacher[pNum] = teacher
        //objectWillChange.send()
    }

}

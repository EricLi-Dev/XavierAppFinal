//
//  scheduleSummar.swift
//  XavierApp
//
//  Created by Eric Li on 7/25/20.
//

import Foundation

class schedData: ObservableObject {
    
    @Published var Data = [[String]]()
    
    init() {
        
        Data = [
            ["A", "US His.", "Mil Sci 11", "CP", "Religion11", "Calculus", "Lunch", "AP Phys 1", "AP Eng 11"],
            ["B", "AP Comp Sci", "PE 11&12", "CP", "Spanish 3", "Lunch", "US His.", "Mil Sci 11", "Religion11"],
            ["C", "Calculus", "AP Phys 1", "CP", "AP Eng 11", "AP CompSci", "Lunch", "PE 11&12", "Spanish 3"],
            ["D", "Free", "Religion 11", "CP", "US His.", "Lunch", "AP Phys 1", "AP Eng 11", "Calculus",],
            ["E", "Free", "Spanish 3", "CP", "AP CompSci", "Lunch", "Mil Sci 11", "Religion 11", "Free"],
            ["F", "AP Phys 1", "AP Eng 11", "CP", "Calculus", "Free", "Lunch", "Spanish 3", "Free"],
            ["G", "Calculus", "CP", "US His.", "Religion 11", "Mil Sci 11"],
            ["H", "AP Comp Sci", "CP", "AP Phys 1", "AP Eng 11", "Spanish 3"]
            
        ]
    }

   
}


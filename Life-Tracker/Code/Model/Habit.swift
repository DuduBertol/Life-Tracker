//
//  Habit.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id: UUID
    
    var name: String
    var daysLifetime: [Day]
    
    init(id: UUID = UUID(), name: String, daysLifetime: [Day]) {
        self.id = id
        self.name = name
        self.daysLifetime = daysLifetime
    }
}

extension Array where Element == Habit {
    static func habits() -> [Habit] {
        [
            Habit(name: "sleep 8hr", daysLifetime: []),
            Habit(name: "exercise", daysLifetime: []),
            Habit(name: "english", daysLifetime: [])
            
//            Habit(name: "sleep 8hr", isDoneToday: false, daysLifetime: []),
//            Habit(name: "exercise", isDoneToday: false, daysLifetime: []),
//            Habit(name: "english", isDoneToday: false, daysLifetime: [])
        ]
    }
}

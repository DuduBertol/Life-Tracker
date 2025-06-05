//
//  Habit.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import Foundation

struct Habit: Identifiable {
    var id: UUID = UUID()
    
//Stack >> next, data
    var name: String
    var isDoneToday: Bool = false
    var daysLifetime: [Day] //ordem crescente
}

extension Array where Element == Habit {
    static func habits() -> [Habit] {
        [
            Habit(name: "sleep 8hr", isDoneToday: false, daysLifetime: []),
            Habit(name: "exercise", isDoneToday: false, daysLifetime: []),
            Habit(name: "english", isDoneToday: false, daysLifetime: [])
        ]
    }
}

//
//  Habit.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import Foundation

struct Habit: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var isDoneToday: Bool = false
}

extension Array where Element == Habit {
    static func habits() -> [Habit] {
        [
            Habit(name: "sleep 8hr"),
            Habit(name: "exercise"),
            Habit(name: "english"),
            Habit(name: "gym"),
            Habit(name: "swift"),
            Habit(name: "reading"),
            Habit(name: "finance")
        ]
    }
}

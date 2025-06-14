//
//  Event.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 11/06/25.
//

import Foundation

struct Event: Identifiable, Codable {
    var id: UUID
    
    var title: String
    var date: Date
    
    init(id: UUID = UUID(), title: String, date: Date) {
        self.id = id
        self.title = title
        self.date = date
    }
}

extension Array where Element == Event {
    static func events() -> [Event] {
        [
            Event(title: "running", date: Date()),
            Event(title: "birthday", date: Date()),
            Event(title: "travelling", date: Date())
        ]
    }
}

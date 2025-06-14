//
//  Day.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 04/06/25.
//

import Foundation

struct Day: Identifiable, Codable {
    var id: UUID
    
    var date: Date
    var isDone: Bool
    
    init(id: UUID = UUID(), date: Date, isDone: Bool) {
        self.id = id
        self.date = date
        self.isDone = isDone
    }
}

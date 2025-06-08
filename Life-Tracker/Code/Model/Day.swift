//
//  Day.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 04/06/25.
//

import Foundation

struct Day: Identifiable {
    var id: UUID = UUID()
    
    var date: Date
    var isDone: Bool
}

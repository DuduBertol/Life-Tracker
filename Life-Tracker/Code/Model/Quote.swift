//
//  Quotes.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 11/06/25.
//

import Foundation

struct Quote: Identifiable, Codable {
    var id: UUID
    
    var phrase: String
    var author: String
    
    init(id: UUID = UUID(), phrase: String, author: String) {
        self.id = id
        self.phrase = phrase
        self.author = author
    }
}

extension Array where Element == Quote {
    static func quotes() -> [Quote] {
        [
            Quote(phrase: "A bondade é o único investimento que nunca falha.", author: "H. D. Thoreau"),
            Quote(phrase: "A simplicidade é a máxima sofisticação.", author: "Steve Jobs"),
            Quote(phrase: "A excelência é trivial.", author: "Daniel Chambliss")
        ]
    }
}

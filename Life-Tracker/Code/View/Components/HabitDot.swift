//
//  HabitDot.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 04/06/25.
//

import SwiftUI

struct HabitDot: View {
    
    @State var isActive: Bool
    
    var body: some View {
        Rectangle()
            .frame(width: 25, height: 25)
            .foregroundStyle(isActive ? .sBlack : .sWhite)

    }
}

#Preview {
    HabitDot(isActive: true)
}

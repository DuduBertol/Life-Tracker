//
//  SingleTracker.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct SingleTracker: View {
    
    @Binding var habit: Habit
    
    var body: some View {
        //MARK: SINGLE HABIT
        HStack{
            Text(habit.name)
                .font(.system(size: 28, weight: .regular))
            Spacer()
            Button{
                //Track habit
            }label:{
                ZStack{
                    Circle()
                        .foregroundStyle(.sBlack)
                        .frame(width: 50)
                        .shadow(radius: 4, x: 0, y: 4)
                    Image(systemName: "plus")
                        .foregroundStyle(.sWhite)
                        .font(.system(size: 20, weight: .thin))
                }
            }
        }
    }
}

#Preview {
    SingleTracker(habit: .constant(Habit(name: "sleep 8hr")))
}

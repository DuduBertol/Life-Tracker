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
            Text($habit.wrappedValue.name)
                .font(.system(size: 28, weight: .regular))
                .strikethrough($habit.wrappedValue.isDoneToday)
                .foregroundStyle($habit.wrappedValue.isDoneToday ? .sGray2 : .sBlack)
            Spacer()
            Button{
                //Track habit
                trackHabit(habit: $habit)
            }label:{
                ZStack{
                    Circle()
                        .foregroundStyle($habit.wrappedValue.isDoneToday ? .sGray2 : .sBlack)
                        .frame(width: 50)
                        .shadow(radius: 4, x: 0, y: 4)
                    Image(systemName: "plus")
                        .foregroundStyle(.sWhite)
                        .font(.system(size: 20, weight: .thin))
                }
            }
        }
    }
    
    func trackHabit(habit: Binding<Habit>){
        withAnimation{
            $habit.wrappedValue.isDoneToday = true
            
            let lastIndex = $habit.daysLifetime.wrappedValue.count - 1
            $habit.wrappedValue.daysLifetime[lastIndex].isDone = true
        }
        
//        $habit.wrappedValue.daysLifetime.append(Day(date: 1, isDone: true))
//        print($habit.wrappedValue.daysLifetime)
    }
}

#Preview {
    SingleTracker(habit: .constant(Habit(name: "sleep 8hr", isDoneToday: false, daysLifetime: [])))
}

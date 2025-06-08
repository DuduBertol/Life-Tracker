//
//  SingleTracker.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct SingleTracker: View {
    
    @Binding var habit: Habit
    @Binding var currentDate: Date
    
    var body: some View {
        //MARK: SINGLE HABIT
        HStack{
            Text($habit.wrappedValue.name)
                .font(.system(size: 28, weight: .regular))
                .strikethrough(isDoneToday())
                .foregroundStyle(isDoneToday() ? .sGray2 : .sBlack)
            Spacer()
            Button{
                //Track habit
                trackHabit(habit: $habit)
            }label:{
                ZStack{
                    Circle()
                        .foregroundStyle(isDoneToday() ? .sGray2 : .sBlack)
                        .frame(width: 50)
                        .shadow(radius: 4, x: 0, y: 4)
                    Image(systemName: "plus")
                        .foregroundStyle(.sWhite)
                        .font(.system(size: 20, weight: .thin))
                }
            }
            .disabled(isDoneToday())
        }
    }
    
    func trackHabit(habit: Binding<Habit>){
        withAnimation{
            $habit.wrappedValue.daysLifetime.append(Day(date: $currentDate.wrappedValue, isDone: true))
//            $habit.wrappedValue.isDoneToday = true
//            
//            let lastIndex = $habit.daysLifetime.wrappedValue.count - 1
//            $habit.wrappedValue.daysLifetime[lastIndex].isDone = true
        }
        
//        $habit.wrappedValue.daysLifetime.append(Day(date: 1, isDone: true))
//        print($habit.wrappedValue.daysLifetime)
    }
    
    func isDoneToday() -> Bool {
        // 2. LÓGICA CORRIGIDA: Procuramos pelo dia do calendário no histórico do hábito
        if habit.daysLifetime.firstIndex(where: { trackedDay in
            Calendar.current.isDate(trackedDay.date, inSameDayAs: $currentDate.wrappedValue)
        }) != nil {
            // Se encontramos, significa que o hábito foi registrado neste dia.
            return true
        } else {
            // Se não encontramos, significa que não houve registro neste dia.
            return false
        }
    }
}

#Preview {
    SingleTracker(habit: .constant(Habit(name: "sleep 8hr", daysLifetime: [])), currentDate: .constant(Date()))
}

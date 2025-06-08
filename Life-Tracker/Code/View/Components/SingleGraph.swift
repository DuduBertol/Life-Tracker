//
//  SingleGraph.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct SingleGraph: View {
    
    @Binding var habit: Habit
    @State var streak: Int
    
    // 1. CORREÇÃO DA ORIENTAÇÃO: Pedimos as datas em ordem ascendente.
    let last30Days: [Date] = getLastNDays(count: 30, order: .ascending)
    
    // SUGESTÃO: Usei 10 colunas para um grid perfeito de 10x3 para os 30 dias.
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 10)
    
    var body: some View {
        //MARK: SINGLE GRAPH
        VStack(spacing: 10){
            HStack{
                Text(habit.name)
                    .font(.system(size: 28, weight: .regular))
                Spacer()
                Text("\(streak)")
                    .font(.system(size: 13, weight: .thin))
            }
            
            LazyVGrid(columns: columns, spacing: 0) {
                // Iteramos sobre os 30 dias do calendário
                ForEach(last30Days, id: \.self) { calendarDay in
                    
                    // 2. LÓGICA CORRIGIDA: Procuramos pelo dia do calendário no histórico do hábito
                    if let dayIndex = habit.daysLifetime.firstIndex(where: { trackedDay in
                        Calendar.current.isDate(trackedDay.date, inSameDayAs: calendarDay)
                    }) {
                        // Se encontramos, significa que o hábito foi registrado neste dia.
                        // Usamos o binding para a propriedade 'isDone' daquele dia específico.
                        HabitDot(isActive: $habit.daysLifetime[dayIndex].isDone)
                        
                    } else {
                        // Se não encontramos, significa que não houve registro neste dia.
                        // Exibimos um ponto inativo. Usamos .constant(false) porque
                        // não há um estado real para vincular (bind), mas o HabitDot
                        // espera um Binding<Bool>.
                        HabitDot(isActive: .constant(false))
                    }
                }
            }
            .cornerRadius(16)
        }
        .frame(maxWidth: 250)
    }
}


#Preview {
    // Exemplo de dados para o Preview
    // Criando um histórico de hábito com alguns dias marcados como 'true'
    let sampleDays: [Day] = [
        Day(date: Date(), isDone: true), // Hoje
        Day(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, isDone: true), // Ontem
        Day(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, isDone: true), // 3 dias atrás
        Day(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, isDone: false), // 4 dias atrás (registrado mas não feito)
        Day(date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!, isDone: true)
    ]
    
    let sampleHabit = Habit(name: "Ler 20p", daysLifetime: sampleDays)
    
    return SingleGraph(habit: .constant(sampleHabit), streak: 2)
}


/*
import SwiftUI

struct SingleGraph: View {
    
    @Binding var habit: Habit
    @State var streak: Int
    
    let last30Days: [Date] = getLastNDays(count: 30, order: .descending)
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        ]
    
    var body: some View {
        
        //MARK: SINGLE GRAPH
        VStack(spacing: 10){
            HStack{
                Text(habit.name)
                    .font(.system(size: 28, weight: .regular))
                Spacer()
                Text("\(streak)")
                    .font(.system(size: 13, weight: .thin))
            }
            
            LazyVGrid(columns: columns, spacing: 0){
                
                ForEach(last30Days.indices, id: \.self) { i in
                    habitDotCheck(i)
                }
            }
            .cornerRadius(16)
        }
        .frame(maxWidth: 250)
        
    }
    
    func habitDotCheck(_ i: Int) -> HabitDot{
        if i < $habit.daysLifetime.count{
            
            let dateStr = formatDate(last30Days[i])
            let habitDateStr = $habit.wrappedValue.daysLifetime[i].date
            
//            print("Real date: \(dateStr) ||| Habit date: \(habitDateStr)")
            
            if dateStr == habitDateStr {
                return HabitDot(isActive: $habit.wrappedValue.daysLifetime[i].isDone)
            }
        }
        
        return HabitDot(isActive: true)
    }
}

#Preview {
    SingleGraph(habit: .constant(Habit(name: "sleep 8hr", isDoneToday: false, daysLifetime: [])), streak: 80)
//        .frame(maxWidth: 250)
    
}
*/

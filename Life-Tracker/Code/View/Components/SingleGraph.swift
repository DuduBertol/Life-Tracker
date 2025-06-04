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
                
                //TODO: aqui vou ter que fazer a verificação para cor dos HabitDots
                ForEach(0..<30){ _ in
                    
                    //temp code
                    let rndm = Double.random(in: 0...1)
                    let state = rndm > 0.5 ? true : false
                    //
                    
                    HabitDot(isActive: state)
                }
            }
            .cornerRadius(16)
        }
        .frame(maxWidth: 250)
        
    }
}

#Preview {
    SingleGraph(habit: .constant(Habit(name: "sleep 8hr")), streak: 80)
//        .frame(maxWidth: 250)
    
}

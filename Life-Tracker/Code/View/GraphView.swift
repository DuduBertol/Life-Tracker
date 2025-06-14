//
//  HomeView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct GraphView: View {
    
    @EnvironmentObject var habitsViewModel: HabitsViewModel
//    @Binding var habits: [Habit]
    @Binding var currentDate: Date
    
    var body: some View {
        
        //MARK: HOME
        ScrollView{
            
            
            //MARK: CONTENT
            VStack(alignment: .leading){

                
                //MARK: GRAPHS LIST
                VStack(alignment: .leading, spacing: 40){
                    ForEach($habitsViewModel.habits) { $habit in
                        SingleGraph(habit: $habit, streak: 250)
                    }
                    
                }
//                .frame(maxWidth: 250)
                
                
                Spacer()
                
            }
//            .border(.red)
            .padding([.leading, .trailing, .bottom], 32)
            
            
        }
    }
}

#Preview {
    EditBar(showModal: .constant(true))
    GraphView(currentDate: .constant(Date()))
        .environmentObject(HabitsViewModel())
    TabBar(selectedView: .constant(.graph))
}

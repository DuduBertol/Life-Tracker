//
//  HomeView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct TrackView: View {
    
    @EnvironmentObject var habitsViewModel: HabitsViewModel
//    @Binding var habits: [Habit]
    @Binding var currentDate: Date
    
    var body: some View {
        
        //MARK: HOME
        ScrollView{
            
            
            //MARK: CONTENT
            VStack{
                
                
 
                
                //MARK: HABIT LIST
                VStack(spacing: 40){
                    
                    ForEach($habitsViewModel.habits) { $habit in
                        SingleTracker(habit: $habit, currentDate: $currentDate)
                    }
                    
                }
                
                Spacer()
                
            }
//            .border(.red)
            .padding([.leading, .trailing, .bottom], 32)
            
            
            
        }
    }
}

#Preview {
    EditBar(showModal: .constant(true))
    TrackView(currentDate: .constant(Date()))
        .environmentObject(HabitsViewModel())
    TabBar(selectedView: .constant(.track))
}

//
//  HabitsSheet.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 12/06/25.
//

import SwiftUI

struct HabitsSheet: View {
    @Environment(\.dismiss) var dismiss
    
//    @Binding var habits: [Habit]
    @EnvironmentObject var habitsViewModel: HabitsViewModel

    @State var createHabitStackEnabled: Bool = false
    
    @State var habitNameText: String = ""
    
    var body: some View {
        
        ScrollView{
            //MARK: MODAL
            
            VStack(alignment: .leading, spacing: 24){
                
                //MARK: HABITS TITLE
                HStack{
                    Text("habits")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("new habit:")
                        Spacer()
                        Button{
                            withAnimation{
                                createHabitStackEnabled.toggle()
                            }
                        }label:{
                            Image(systemName: "plus")
                        }
                    }
                    .font(.system(size: 20, weight: .light))
                    .foregroundStyle(.sBlack)
                    
                    //MARK: CREATE HABIT
                    if createHabitStackEnabled{
                        VStack(alignment: .leading){
                            Text("content:")
                                .font(.system(size: 16, weight: .thin))
                                .foregroundStyle(.sBlack)
                            TextField("type here...", text: $habitNameText)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(.sGray3)
                                .cornerRadius(16)
                        }
                        .padding(.leading, 16)
                        
                        HStack{
                            Spacer()
                            Button{
                                habitsViewModel.addHabit(name: habitNameText)
                                //get content
                                //create newHabit Habit(content)
                                //habit list append newHabit
                            }label:{
                                Text("add")
                                    .font(.system(size: 16, weight: .thin))
                                    .foregroundStyle(.sBlack)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                    
                    //MARK: HABITS LIST
                    VStack(alignment: .leading, spacing: 16){
                        
                        HStack{
                            Text("my habits:")
                                .font(.system(size: 20, weight: .light))
                            Spacer()
                            Text("\($habitsViewModel.habits.count)")
                                .font(.system(size: 12, weight: .thin))
                        }
                        
                        ForEach($habitsViewModel.habits) { $habit in
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text($habit.wrappedValue.name)
                                        .font(.system(size: 16, weight: .light))
                                        .foregroundStyle(.sBlack2)
                                }
                                
                                Spacer()
                                
                                if createHabitStackEnabled{
                                    Button{
                                        withAnimation{
                                            habitsViewModel.removeHabit(habit: $habit.wrappedValue)
                                        }
                                    }label:{
                                        Image(systemName: "minus")
                                            .padding(.leading, 16)
                                            .font(.system(size: 20, weight: .light))
                                            .foregroundStyle(.sBlack)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 24)
                    
                }
                
                
                Spacer()
            }
            .padding(32)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label:{
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .regular))
                    }
                    .foregroundStyle(.sBlack)
                }
            }
        }
    }
}

#Preview {
    HabitsSheet()
        .environmentObject(HabitsViewModel())
}

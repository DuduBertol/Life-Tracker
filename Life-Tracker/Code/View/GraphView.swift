//
//  HomeView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct GraphView: View {
    
    @Binding var habits: [Habit]
    
    var body: some View {
        
        //MARK: HOME
        ScrollView{
            
            
            //MARK: CONTENT
            VStack(alignment: .leading){
                
                
                //MARK: EDIT BAR
                HStack{
                    Spacer()
                    Button{
                        
                    }label:{
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.sBlack)
                    }
                }
                .padding(.vertical, 16)
//                .border(.yellow)
                
                //MARK: GRAPHS LIST
                VStack(spacing: 40){
                    ForEach($habits) { $habit in
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
    GraphView(habits: .constant(.habits()))
    TabBar(selectedView: .constant(.graph))
}

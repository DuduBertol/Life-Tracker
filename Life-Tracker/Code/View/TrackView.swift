//
//  HomeView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct TrackView: View {
    
    @Binding var habits: [Habit]
    
    var body: some View {
        
        //MARK: HOME
        ScrollView{
            
            
            //MARK: CONTENT
            VStack{
                
                
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
                
                //MARK: HABIT LIST
                VStack(spacing: 40){
                    
                    ForEach($habits) { $habit in
                        SingleTracker(habit: $habit)
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
    TrackView(habits: .constant(.habits()))
    TabBar(selectedView: .constant(.track))
}

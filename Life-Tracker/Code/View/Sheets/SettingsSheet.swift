//
//  settingsSheet.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 10/06/25.
//

import SwiftUI

struct SettingsSheet: View {
    
    var body: some View {
        
        NavigationStack{
            //MARK: MODAL
            
            VStack(alignment: .leading, spacing: 24){
                
                //MARK: BACK BUTTON (fake space)
                Button{
                    
                }label:{
                    HStack{
                        Text(" ")
                            .font(.system(size: 16, weight: .regular))
                        Spacer()
                    }
                }
                .foregroundStyle(.sBlack)
                
                //MARK: PROFILE
                HStack{
                    Text("profile")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                    NavigationLink{
                        ProfileSheet()
                    }label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.sBlack)
                    }
                }
                
                //MARK: QUOTES
                HStack{
                    Text("quotes")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                    NavigationLink{
                        QuotesSheet()
                    }label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.sBlack)
                    }
                }
                
                //MARK: EVENTS
                HStack{
                    Text("events")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                    NavigationLink{
                        EventsSheet()
                    }label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.sBlack)
                    }
                }
                
                
                //MARK: HABITS
                HStack{
                    Text("habits")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                    NavigationLink{
                        HabitsSheet()
                    }label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.sBlack)
                    }
                }
                
                Spacer()
            }
            .padding(32)
        }
    }
}

#Preview {
    SettingsSheet()
        .environmentObject(QuotesViewModel())
        .environmentObject(EventsViewModel())
}

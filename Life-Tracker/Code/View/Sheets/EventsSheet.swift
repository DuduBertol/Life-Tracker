//
//  EventsView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 11/06/25.
//

import SwiftUI

struct EventsSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var eventsViewModel: EventsViewModel

    @State var createEventStackEnabled: Bool = false
    
    @State var titleText: String = ""
    @State var dateTemp: Date = Date()
    
    let calendar: Calendar = Calendar.current
    
    var body: some View {
        
        ScrollView{
            //MARK: MODAL
            
            VStack(alignment: .leading, spacing: 24){
                
                //MARK: EVENTS TITLE
                HStack{
                    Text("events")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("new event:")
                            .font(.system(size: 20, weight: .light))
                        Spacer()
                        Button{
                            withAnimation{
                                createEventStackEnabled.toggle()
                            }
                        }label:{
                            Image(systemName: "plus")
                        }
                    }
                    .font(.system(size: 20, weight: .light))
                    .foregroundStyle(.sBlack)
                    
                    //MARK: CREATE EVENT
                    if createEventStackEnabled{
                        VStack(alignment: .leading){
                            Text("title:")
                                .font(.system(size: 16, weight: .thin))
                                .foregroundStyle(.sBlack)
                            TextField("type your event title here...", text: $titleText)
                                .autocorrectionDisabled(true)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(.sGray3)
                                .cornerRadius(16)
                        }
                        .padding(.leading, 16)
                        
                        VStack(alignment: .leading){
                            Text("date:")
                                .font(.system(size: 16, weight: .thin))
                                .foregroundStyle(.sBlack)
                            DatePicker("", selection: $dateTemp, displayedComponents: .date)
                            
                        }
                        .padding(.leading, 16)
                        
                        HStack{
                            Spacer()
                            Button{
                                eventsViewModel.addEvent(title: $titleText.wrappedValue, date: $dateTemp.wrappedValue)
                                
                                titleText = ""
                                dateTemp = Date()
                            }label:{
                                Text("add")
                                    .font(.system(size: 16, weight: .thin))
                                    .foregroundStyle(.sBlack)
                                    .padding(.trailing, 16)
                            }
                        }
                        
                    }
                    
                    //MARK: EVENT LIST
                    VStack(alignment: .leading, spacing: 16){
                        HStack{
                            Text("my events:")
                                .font(.system(size: 20, weight: .light))
                            Spacer()
                            Text("\($eventsViewModel.events.count)")
                                .font(.system(size: 12, weight: .thin))
                        }
                        ForEach($eventsViewModel.events) { $event in
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(calendar.component(.day, from: $event.wrappedValue.date))")
                                        .font(.system(size: 28, weight: .regular))
                                        .foregroundStyle(.sBlack2)
                                    Text($event.wrappedValue.title)
                                        .font(.system(size: 16, weight: .light))
                                        .foregroundStyle(.sBlack2)
                                }
                                
                                Spacer()
                                
                                if createEventStackEnabled{
                                    Button{
                                        withAnimation{
                                            eventsViewModel.removeEvent(event: $event.wrappedValue)
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
    EventsSheet()
        .environmentObject(EventsViewModel())
}

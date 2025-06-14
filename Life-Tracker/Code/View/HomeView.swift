//
//  HomeView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var currentDate: Date
    
//    @Binding var name: String
//    @Binding var quotes: [Quote]
//    @Binding var events: [Event]
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var quotesViewModel: QuotesViewModel
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    let calendar: Calendar = Calendar.current
    
    var body: some View {
        
        //MARK: HOME
        VStack{
            
            
            //MARK: CONTENT
            VStack{
                
                
                //MARK: TITLE
                let titlePhrase: String = "good morning, " + $profileViewModel.name.wrappedValue
                Text(titlePhrase)
                    .font(.system(size: 28, weight: .thin))
                
                Spacer()
                
                //MARK: TEMPERATURE
                WeatherView()
                
                Spacer()
                
                //MARK: QUOTE
                VStack(alignment: .leading){
                    let quote: Quote = $quotesViewModel.quotes.wrappedValue[Int.random(in: 0..<$quotesViewModel.quotes.wrappedValue.count)]
                    
                    Text("\"\(quote.phrase)\"")
                        .font(.system(size: 20, weight: .light))
                        .foregroundStyle(.sBlack2)
                    HStack{
                        Spacer()
                        Text(quote.author)
                            .font(.system(size: 12, weight: .thin))
                            .foregroundStyle(.sBlack2)
                    }
                }
                
                Spacer()
                
                //MARK: EVENTS
                VStack(alignment: .leading, spacing: 24){
                    //EVENTS - TITLE
                    HStack{
                        Text("your events")
                            .font(.system(size: 28, weight: .thin))
                            .foregroundStyle(.sBlack)
                        Spacer()
                        Button{
                            
                        }label:{
                            Image(systemName: "plus")
                                .foregroundStyle(.sBlack)
                                .font(.system(size: 28, weight: .thin))
                        }
                    }
                    //EVENTS - LIST
                    VStack(spacing: 16){
                        
                        ForEach($eventsViewModel.events) { $event in
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(calendar.component(.day, from: $event.date.wrappedValue))")
                                        .font(.system(size: 28, weight: .regular))
                                        .foregroundStyle(.sBlack2)
                                    Text(event.title)
                                        .font(.system(size: 16, weight: .light))
                                        .foregroundStyle(.sBlack2)
                                }
                                
//                                Spacer()
                            }
                        }
                        
                    }
                }
            }
//            .border(.red)
            .padding([.leading, .trailing, .bottom], 32)
            
            
            
        }
        .onAppear {
            quotesViewModel.loadQuotes()
        }
    }
}

#Preview {
    EditBar(showModal: .constant(true))
    HomeView(currentDate: .constant(Date()))
        .environmentObject(ProfileViewModel())
        .environmentObject(QuotesViewModel())
        .environmentObject(EventsViewModel())
    TabBar(selectedView: .constant(.home))
}

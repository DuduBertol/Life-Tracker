//
//  AppViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct ViewController: View {
    
    // 3. Acessa a instância do ViewModel que foi injetada no ambiente.
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var quotesViewModel: QuotesViewModel
    @EnvironmentObject var eventsViewModel: EventsViewModel
    @EnvironmentObject var habitsViewModel: HabitsViewModel
    
    @State private var simulatedCurrentDate: Date = Date()
    
    @State var selectedView: Views = .home
    
//    @State var name: String = "dudu"
//    @State var habits: [Habit] = .habits()
//    @State var quotes: [Quote] = .quotes()
//    @State var events: [Event] = .events()
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack{
            EditBar(showModal: $showModal)
            
            TabView(selection: $selectedView) {
                
                HomeView(currentDate: $simulatedCurrentDate)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(Views.home)
                
                TrackView(currentDate: $simulatedCurrentDate)
                    .tabItem {
                        Label("Track", systemImage: "plus")
                    }
                    .tag(Views.track)
                
                GraphView(currentDate: $simulatedCurrentDate)
                    .tabItem {
                        Label("Graph", systemImage: "chart.pie")
                    }
                    .tag(Views.graph)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            TabBar(selectedView: $selectedView)
            
            // MARK: - DEV CONTROLS
            VStack {
                // Formatter para exibir a data de forma legível
                let dateFormatter: DateFormatter = {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/yyyy"
                    return formatter
                }()
                
                Text("Data Simulada: \(dateFormatter.string(from: simulatedCurrentDate))")
                    .font(.caption)
                    .padding(.top, 5)
                
                HStack {
                    Button("<< Passar Dia") {
                        passDay()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    
                    Button("Resetar para Hoje") {
                        simulatedCurrentDate = Date()
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                }
            }
            .padding(.bottom, 5)
            
        }
        .sheet(isPresented: $showModal) {
            SettingsSheet()
                .presentationDetents(
                    [
                        withAnimation{
                            .medium
                        }
                    ]
                )
        }
    }
    
    func passDay() {
        // Usa Calendar para subtrair um dia da data simulada atual
        if let newDate = Calendar.current.date(byAdding: .day, value: -1, to: simulatedCurrentDate) {
            simulatedCurrentDate = newDate
        }
    }

}

#Preview {
    ViewController()
        .environmentObject(ProfileViewModel())
        .environmentObject(QuotesViewModel())
        .environmentObject(EventsViewModel())
        .environmentObject(HabitsViewModel())
}

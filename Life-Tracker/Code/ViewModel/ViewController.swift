//
//  AppViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct ViewController: View {
    
//    var habitsViewModel: HabitsViewModel
    
    @State private var simulatedCurrentDate: Date = Date()
    
    @State var selectedView: Views = .home
    
    @State var habits: [Habit] = .habits()
    
    var body: some View {
        VStack{
            TabView(selection: $selectedView) {
                HomeView(currentDate: $simulatedCurrentDate)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(Views.home)
                
                TrackView(habits: $habits, currentDate: $simulatedCurrentDate)
                    .tabItem {
                        Label("Track", systemImage: "plus")
                    }
                    .tag(Views.track)
                
                GraphView(habits: $habits, currentDate: $simulatedCurrentDate)
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
}

/*
 NavigationStack{
 VStack {
 Spacer()
 
 switch selectedView {
 
 case .home:
 HomeView()
 
 case .track:
 TrackView()
 
 case .graph:
 GraphView()
 
 }
 
 TabBar(selectedView: $selectedView)
 }
 .background(.sWhite)
 }
 */

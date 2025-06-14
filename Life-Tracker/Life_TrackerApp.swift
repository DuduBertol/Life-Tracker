//
//  Life_TrackerApp.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

@main
struct Life_TrackerApp: App {
    
    // 1. Cria uma única instância do ViewModel que viverá durante todo o ciclo de vida do app.
    @StateObject private var profileViewModel = ProfileViewModel()
    @StateObject private var quotesViewModel = QuotesViewModel()
    @StateObject private var eventsViewModel = EventsViewModel()
    @StateObject private var habitsViewModel = HabitsViewModel()
    
    var body: some Scene {
        WindowGroup {
            // 2. Injeta o ViewModel no ambiente do SwiftUI.
            // Agora, qualquer view filha pode acessar este ViewModel.
            ViewController()
                .environmentObject(profileViewModel)
                .environmentObject(quotesViewModel)
                .environmentObject(eventsViewModel)
                .environmentObject(habitsViewModel)
                .preferredColorScheme(.light)
        }
    }
}

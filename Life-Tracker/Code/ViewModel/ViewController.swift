//
//  AppViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct ViewController: View {
    
    @State var selectedView: Views = .home
    
    @State var habits: [Habit] = .habits()
    
    var body: some View {
        VStack{
            TabView(selection: $selectedView) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill") // Ícone e texto para a aba
                    }
                    .tag(Views.home) // Identificador único para esta aba
                
                TrackView(habits: $habits)
                    .tabItem {
                        Label("Track", systemImage: "plus")
                    }
                    .tag(Views.track)
                
                GraphView(habits: $habits)
                    .tabItem {
                        Label("Graph", systemImage: "chart.pie")
                    }
                    .tag(Views.graph)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            TabBar(selectedView: $selectedView)
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

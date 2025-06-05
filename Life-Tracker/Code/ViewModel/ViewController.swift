//
//  AppViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct ViewController: View {
    
//    var habitsViewModel: HabitsViewModel
    
    @State var fakeDay: Int = 1
    @State var fakeDayStr: String = "01/00"
    
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
            
            
            //MARK: DEV
            HStack{
                Text("\(fakeDay)")
                    .foregroundStyle(.sBlack)
                Button{
                    passDay()
                }label: {
                    Text("Pass day")
                }
            }
        }
        .preferredColorScheme(.light)
        .onAppear{
            checkValues()
        }
    }
    
    func checkValues(){
        print()
        print(fakeDayStr)
        print()
        for i in $habits.indices {
            
            if habits[i].daysLifetime.last?.date != fakeDayStr{
                //Criar novo dia vazio
                habits[i].daysLifetime.append(Day(date: fakeDayStr, isDone: false)) //Dia novo vazio
                
                print(habits[i].name)
                print(habits[i].daysLifetime)
                
                //Habit vazio
                habits[i].isDoneToday = false
            }
        }
    }
    
    func passDay(){
        //ver se está up to date
//        checkValues()
        
        fakeDay += 1
        fakeDayStr = "0\(fakeDay)/00"
        
        //adicionar o novo dia vazio
        checkValues()
        
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

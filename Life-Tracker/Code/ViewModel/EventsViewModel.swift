//
//  EventsViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 13/06/25.
//


import Foundation
import SwiftUI

class EventsViewModel: ObservableObject {
    
    //para entender melhor, lê a lógica em HabitsViewModel
    
    private var starterPack: [Event] = [
        Event(title: "Your Event", date: Date()),
    ]
    
    @Published var events: [Event] = [] {
        didSet{
            saveEvents()
        }
    }
    
    private let saveKey = "eventsData.json"
    
    init() {
        loadEvents()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadEvents() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
           let data = try Data(contentsOf: fileURL)
            
            let decodedEvents = try JSONDecoder().decode([Event].self, from: data)
            self.events = decodedEvents
            print("Eventos carregados com sucesso!")
        } catch {
            print("Não foi possível carregar os Eventos: \(error.localizedDescription). Começando com uma lista vazia.")
            
            //seta um pacote inicial pré pronto
            self.events = starterPack
        }
    }
    
    func saveEvents() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
            let data = try JSONEncoder().encode(events)
            
            try data.write(to: fileURL, options: [.atomicWrite, .completeFileProtection])
            print("Eventos salvos com sucesso!")
        } catch {
            print("Não foi possível salvar os Eventos: \(error.localizedDescription).")
        }
    }
    
    func addEvent(title: String, date: Date) {
        let newEvent = Event(title: title, date: date)
        events.append(newEvent)
    }

    func removeEvent(event: Event){
        events.removeAll { $0.id == event.id }
    }
    
    
    func removeAllEvents_DANGER(){
        events.removeAll()
    }
    
    
    
    
    
    
}

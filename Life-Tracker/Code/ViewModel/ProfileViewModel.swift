//
//  ProfileViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 13/06/25.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    //para entender melhor, lê a lógica em HabitsViewModel
    
    @Published var name: String = "" {
        didSet{
            saveName()
        }
    }
    
    private let saveKey = "nameData.json"
    
    init() {
        loadName()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadName() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
           let data = try Data(contentsOf: fileURL)
            
            let decodedName = try JSONDecoder().decode(String.self, from: data)
            self.name = decodedName
            print("Nome carregado com sucesso!")
        } catch {
            print("Não foi possível carregar o nome: \(error.localizedDescription). Começando com um vazio.")
            self.name = "you"
        }
    }
    
    func saveName() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
            let data = try JSONEncoder().encode(name)
            
            try data.write(to: fileURL, options: [.atomicWrite, .completeFileProtection])
            print("Nome salvos com sucesso!")
        } catch {
            print("Não foi possível salvar o nome: \(error.localizedDescription).")
        }
    }
    
    func editName(name: String) {
        self.name = name
    }
    
}


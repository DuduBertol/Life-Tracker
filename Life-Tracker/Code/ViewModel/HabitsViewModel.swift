//
//  HabitsViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 13/06/25.
//

// HabitsViewModel.swift
import Foundation
import SwiftUI

class HabitsViewModel: ObservableObject {
    
    private var starterPack: [Habit] = [
        Habit(name: "sleep 8hr", daysLifetime: [])
    ]
    
    // @Published garante que qualquer View observando este ViewModel
    // será atualizada quando o array de 'habits' mudar.
    @Published var habits: [Habit] = [] {
        // Toda vez que o array de hábitos for modificado,
        // chamamos a função save() automaticamente.
        didSet {
            saveHabits()
        }
    }
    
    // Nome do arquivo onde salvaremos os dados
    private let saveKey = "habitsData.json"

    init() {
        // Quando o ViewModel é criado, ele tenta carregar os dados salvos.
        loadHabits()
    }
    
    // Função para obter o caminho do arquivo no diretório de documentos do app
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Função para carregar os hábitos do arquivo
    func loadHabits() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
            let data = try Data(contentsOf: fileURL)
            // Usamos JSONDecoder para converter os dados do arquivo de volta para um array de Habit
            let decodedHabits = try JSONDecoder().decode([Habit].self, from: data)
            self.habits = decodedHabits
            print("Hábitos carregados com sucesso!")
        } catch {
            // Se der erro (ex: arquivo não existe na primeira vez),
            // começamos com uma lista vazia ou dados de exemplo.
            print("Não foi possível carregar os hábitos: \(error.localizedDescription). Começando com uma lista vazia.")
            self.habits = [] // Ou você pode carregar seus dados de exemplo aqui
        }
    }
    
    // Função para salvar os hábitos no arquivo
    func saveHabits() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
            // Usamos JSONEncoder para converter nosso array de Habit para o formato Data (JSON)
            let data = try JSONEncoder().encode(habits)
            // Escrevemos os dados no arquivo
            try data.write(to: fileURL, options: [.atomicWrite, .completeFileProtection])
            print("Hábitos salvos com sucesso!")
        } catch {
            print("Não foi possível salvar os hábitos: \(error.localizedDescription)")
        }
    }
    
    // Você pode adicionar outras funções aqui para manipular os hábitos
    func addHabit(name: String) {
        let newHabit = Habit(name: name, daysLifetime: [])
        habits.append(newHabit)
        // O didSet da propriedade 'habits' chamará saveHabits() automaticamente
    }
    
    func removeHabit(habit: Habit) {
        habits.removeAll { $0.id == habit.id }
    }
    
    func removeAllHabits_DANGER() {
        habits.removeAll()
    }
}

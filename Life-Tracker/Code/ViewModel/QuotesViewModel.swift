//
//  QuotesViewModel.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 13/06/25.
//

import Foundation
import SwiftUI

class QuotesViewModel: ObservableObject {
    
    //para entender melhor, lê a lógica em HabitsViewModel
    
    private var starterPack: [Quote] = [
        Quote(phrase: "A excelência é trivial.", author: "Daniel Chambliss"),
        Quote(phrase: "A simplicidade é a máxima sofisticação.", author: "Steve Jobs"),
    ]
    
    @Published var quotes: [Quote] = [] {
        didSet{
            saveQuotes()
        }
    }
    
    private let saveKey = "quotesData.json"
    
    init() {
        loadQuotes()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadQuotes() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
           let data = try Data(contentsOf: fileURL)
            
            let decodedQuotes = try JSONDecoder().decode([Quote].self, from: data)
            self.quotes = decodedQuotes
            print("Quotes carregados com sucesso!")
        } catch {
            print("Não foi possível carregar os Quotes: \(error.localizedDescription). Começando com uma lista vazia.")
            
            //seta um pacote inicial pré pronto
            self.quotes = starterPack
        }
    }
    
    func saveQuotes() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(saveKey)
        
        do {
            let data = try JSONEncoder().encode(quotes)
            
            try data.write(to: fileURL, options: [.atomicWrite, .completeFileProtection])
            print("Quotes salvos com sucesso!")
        } catch {
            print("Não foi possível salvar os Quotes: \(error.localizedDescription).")
        }
    }
    
    //C - Create > CRUD
    func addQuote(phrase: String, author: String) {
        let newQuote = Quote(phrase: phrase, author: author)
        quotes.append(newQuote)
    }

    //R - Read > CRUD
    //  (não é aqui, nem poderia ser)
    
    //U - Update > CRUD
    //  (não é aqui, mas poderia ser)

    //D - Delete > CRUD
    func removeQuote(quote: Quote){
        quotes.removeAll { $0.id == quote.id }
    }
    
    
    func removeAllQuotes_DANGER(){
        quotes.removeAll()
    }
    
    
    
    
    
    
}

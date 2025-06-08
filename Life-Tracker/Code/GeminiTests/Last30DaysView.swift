//
//  Last30DaysView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 04/06/25.
//

import SwiftUI

struct Last30DaysView: View {
    // Gera a lista dos últimos 30 dias.
    // Você pode chamar isso de um ViewModel ou no .onAppear se os dados
    // precisarem ser carregados dinamicamente ou com base em outra lógica.
    let last30DaysDescending: [Date] = getLastNDays(count: 30, order: .descending)
    let last30DaysAscending: [Date] = getLastNDays(count: 30, order: .ascending) 

    // Formatter para exibir as datas de forma legível
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short // Ex: "04/06/2025"
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "pt_BR") // Opcional: para formato brasileiro
        return formatter
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Últimos 30 Dias (Hoje Primeiro)")) {
                    ForEach(last30DaysDescending, id: \.self) { date in
                        // \.self funciona porque Date é Hashable.
                        // Se você tivesse um ID customizado no seu modelo de dados, usaria ele.
                        Text(date, formatter: dateFormatter)
                    }
                }
                
                Section(header: Text("Últimos 30 Dias (Mais Antigo Primeiro)")) {
                    ForEach(last30DaysAscending, id: \.self) { date in
                        
//                        var srtDate = dateFormatter.string(from: date) //STRING DATE
                        Text(date, formatter: dateFormatter)
                    }
                }
            }
            .navigationTitle("Histórico de Datas")
        }
    }
}

#Preview {
    Last30DaysView()
}


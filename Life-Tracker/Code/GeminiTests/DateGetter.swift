//
//  DateGetter.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 04/06/25.
//

import Foundation

enum DateOrder {
    case ascending // Mais antigo para o mais novo (cronológico)
    case descending // Mais novo para o mais antigo (hoje primeiro)
}

// Formatter para exibir as datas de forma legível
public var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short // Ex: "4 de junho de 2025"
    formatter.timeStyle = .none
    formatter.locale = Locale(identifier: "pt_BR") // Opcional: para formato brasileiro
    return formatter
}


func getLastNDays(count: Int, from referenceDate: Date = Date(), order: DateOrder = .descending) -> [Date] {
    let calendar = Calendar.current
    // Usamos startOfDay para garantir que estamos comparando/trabalhando com dias inteiros,
    // removendo a variação de horas/minutos/segundos.
    let startDateOfReference = calendar.startOfDay(for: referenceDate)
    
    var dates: [Date] = []

    for i in 0..<count {
        // Subtrai 'i' dias da data de referência.
        // Se i = 0, é a data de referência (hoje, por padrão).
        // Se i = 1, é o dia anterior, e assim por diante.
        if let date = calendar.date(byAdding: .day, value: -i, to: startDateOfReference) {
            dates.append(date)
        }
    }

    // A 'dates' foi construída em ordem descendente (hoje, ontem, anteontem...).
    // Se a ordem ascendente for solicitada, invertemos o array.
    if order == .ascending {
        return dates.reversed()
    } else {
        return dates
    }
}

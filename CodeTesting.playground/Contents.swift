import Cocoa

import Foundation


print(Date())
print(Date.now)

print(Calendar.current.startOfDay(for: Date.now))
print(Calendar.current.dateComponents([.year, .month, .day], from: Date.now))


let today: Date = Date()

let formatador = DateFormatter()
formatador.dateStyle = .long
formatador.timeStyle = .medium
print(today.formatted())

print(formatador.string(from: today))


let formatador2 = DateFormatter()
formatador2.dateStyle = .short

print(formatador2.string(from: today))


print()
print()
print()
print()




print("Teste Gemini - DATE")
print("===================")

let agora: Date = Date()
let calendario = Calendar.current

let componentesDeAgora = calendario.dateComponents([.year, .month, .day, .hour, .minute, .weekday], from: agora)



// >>>> Usa-se "if" pq Date retorna um optional, e deve ser tratado.

//if let ano = componentesDeAgora.year,
//   let mes = componentesDeAgora.month,
//   let dia = componentesDeAgora.day,
//   let hora = componentesDeAgora.hour,
//   let minuto = componentesDeAgora.minute,
//   let diaDaSemana = componentesDeAgora.weekday { // 1 = Domingo, 2 = Segunda, ... (depende do calendário)
//    print("Ano: \(ano), Mês: \(mes), Dia: \(dia)")
//    print("Hora: \(hora), Minuto: \(minuto)")
//    print("Dia da semana (número): \(diaDaSemana)")
//}


let ano = componentesDeAgora.year!
let mes = componentesDeAgora.month!
let dia = componentesDeAgora.day!
let hora = componentesDeAgora.hour!
let minuto = componentesDeAgora.minute!
let diaDaSemana = componentesDeAgora.weekday!

print("Ano: \(ano), Mês: \(mes), Dia: \(dia)")
print("Hora: \(hora), Minuto: \(minuto)")
print("Dia da semana (número): \(diaDaSemana)")


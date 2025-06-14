//
//  WheaterView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 09/06/25.
//

// WeatherView.swift
import SwiftUI
import CoreLocation
import WeatherKit

struct WeatherView: View {
    // Gerenciador de localização
    @StateObject private var locationManager = LocationManager()
    
    // Estados para guardar a temperatura
    @State private var maxTemp: Measurement<UnitTemperature>?
    @State private var minTemp: Measurement<UnitTemperature>?
    @State private var errorMessage: String?
    
    private var integerTemperatureFormatter: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .temperatureWithoutUnit // Para não mostrar "Celsius", "Fahrenheit", etc.
        formatter.numberFormatter.maximumFractionDigits = 0 // AQUI está a mágica!
        return formatter
    }
    
    var body: some View {
        HStack{
            Spacer()
            
            if let maxTemp = maxTemp, let minTemp = minTemp {
                // Exibe as temperaturas formatadas
                Text("\(integerTemperatureFormatter.string(from: minTemp))")
                    .font(.system(size: 64, weight: .regular))
                    .padding(.trailing, 32)
                
                Text("\(integerTemperatureFormatter.string(from: maxTemp))")
                    .font(.system(size: 64, weight: .regular))
                
            } else if locationManager.isLoading || errorMessage == nil {
                // Mostra um indicador de progresso enquanto carrega
                ProgressView("Obtendo previsão do tempo...")
            } else if let errorMessage = errorMessage {
                // Mostra a mensagem de erro, se houver
                Button{ Task{ await fetchWeather() }
                }label:{
                    (Image(systemName: "arrow.trianglehead.counterclockwise"))
                }
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .task {
            // Este bloco executa quando a view aparece
            await fetchWeather()
        }
    }
    
    private func fetchWeather() async {
        // Primeiro, obtemos a localização do usuário
        locationManager.requestLocation()
        
        // Espera até que a localização esteja disponível
        guard let location = await waitForLocation() else {
            self.errorMessage = "Não foi possível obter a localização. Por favor, verifique suas permissões."
            return
        }
        
        do {
            // Se temos a localização, buscamos o clima
            let weatherService = WeatherService.shared
            
            // Pedimos a previsão diária (daily)
            let forecast = try await weatherService.weather(for: location, including: .daily)
            
            // A previsão de hoje é o primeiro item do forecast diário
            if let todayForecast = forecast.first {
                self.maxTemp = todayForecast.highTemperature
                self.minTemp = todayForecast.lowTemperature
                self.errorMessage = nil
            } else {
                self.errorMessage = "Não foi possível obter a previsão para hoje."
            }
            
        } catch {
            // Lida com erros do WeatherKit
            print("Erro ao buscar dados do WeatherKit: \(error)")
            self.errorMessage = "Falha ao obter dados do clima. Tente novamente."
        }
    }
    
    // Função auxiliar para esperar de forma assíncrona pela localização
    private func waitForLocation() async -> CLLocation? {
        // Tenta obter a localização por até 10 segundos
        for _ in 0..<100 { // 100 * 0.1s = 10 segundos
            if let location = locationManager.location {
                return location
            }
            try? await Task.sleep(nanoseconds: 100_000_000) // Espera 0.1 segundo
        }
        return nil
    }
}

#Preview {
    WeatherView()
}

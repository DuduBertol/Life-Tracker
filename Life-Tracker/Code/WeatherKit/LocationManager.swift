//
//  LocationManager.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 09/06/25.
//

// LocationManager.swift
import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var isLoading = false

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        isLoading = true
        manager.requestWhenInUseAuthorization() // Pede permissão
        manager.startUpdatingLocation() // Começa a procurar a localização
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
        manager.stopUpdatingLocation() // Para de procurar após encontrar
        isLoading = false
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erro ao obter localização: \(error)")
        isLoading = false
    }
}

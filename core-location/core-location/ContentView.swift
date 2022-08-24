//
//  ContentView.swift
//  core-location
//
//  Created by Andrew on 2022-08-23.
//

import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, ObservableObject {
    private var locationManager: CLLocationManager?
    @Published var speed: Double = 0.0
    @Published var log: String = ""
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        super.init()
        self.locationManager = locationManager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            log = "Location authorization not determined"
        case .restricted:
            log = "Location authorization restricted"
        case .denied:
            log = "Location authorization denied"
        case .authorizedAlways:
            manager.requestLocation()
            log = "Location authorization always granted"
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            log = "Location authorization when in use granted"
        @unknown default:
            log = "Unknown authorization status"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.forEach { location in
            self.speed = location.speed
        }
    }
}

struct ContentView: View {
    @ObservedObject private var locationViewModel = LocationViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text(String(format: "Speed: %.2f m/s", locationViewModel.speed))
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(locationViewModel.speed < 1.0 ? .gray : .green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                Text(locationViewModel.log)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  battery-level
//
//  Created by Andrew on 2022-06-30.
//

import SwiftUI

class BatteryViewModel: ObservableObject {
    @Published var batteryLevel: Int = 0
    @Published var batteryStateDescription: String = ""
    @Published var batteryStateColor: Color = .gray
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
        setBatteryState()
        
        // Notification observers
        NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange(notification:)), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange(notification:)), name: UIDevice.batteryStateDidChangeNotification, object: nil)
    }
    
    @objc func batteryLevelDidChange(notification: Notification) {
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
    }
    
    @objc func batteryStateDidChange(notification: Notification) {
        setBatteryState()
    }
    
    private func setBatteryState() {
        let batteryState = UIDevice.current.batteryState
        self.batteryStateDescription = getBatteryDescription(for: batteryState)
        self.batteryStateColor = getBatteryColor(for: batteryState)
    }
    
    private func getBatteryColor(for state: UIDevice.BatteryState) -> Color {
        switch state {
        case .unplugged:
            return .yellow
        case .charging:
            return .green
        case .full:
            return .blue
        case .unknown:
            return .gray
        @unknown default:
            return .gray
        }
    }
    
    private func getBatteryDescription(for state: UIDevice.BatteryState) -> String {
        switch state {
        case .unplugged:
            return "On battery power"
        case .charging:
            return "Charging"
        case .full:
            return "Full charged"
        case .unknown:
            return "Unknown"
        @unknown default:
            return "Unknown"
        }
    }
}

struct ContentView: View {
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Battery level: \(batteryViewModel.batteryLevel)%")
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                Text("Battery state: \(batteryViewModel.batteryStateDescription)")
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.body.bold())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(batteryViewModel.batteryStateColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

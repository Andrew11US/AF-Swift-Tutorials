import UIKit

protocol Computer {
    func aboutDevice() -> String
}

struct OperatingSystem {
    enum SystemType: String {
        case iOS
        case iPadOS
        case macOS
    }
    
    var version: Int
    var type: SystemType
}

struct Mac: Computer {
    var system: OperatingSystem
    
    init(system: OperatingSystem) {
        self.system = system
    }
    
    func aboutDevice() -> String {
        return "Mac: \(system.type.rawValue) \(system.version)"
    }
}

struct iPhone: Computer {
    var system: OperatingSystem
    
    init(system: OperatingSystem) {
        self.system = system
    }
    
    func aboutDevice() -> String {
        return "iPhone: \(system.type.rawValue) \(system.version)"
    }
}

struct iPad: Computer {
    var system: OperatingSystem
    
    init(system: OperatingSystem) {
        self.system = system
    }
    
    func aboutDevice() -> String {
        return "iPad: \(system.type.rawValue) \(system.version)"
    }
}

struct ComputerFactory {
    static func makeComputer(system: OperatingSystem) -> Computer {
        switch system.type {
        case .iOS:
            return iPhone(system: system)
        case .iPadOS:
            return iPad(system: system)
        case .macOS:
            return Mac(system: system)
        }
    }
}

let computer = ComputerFactory.makeComputer(system: OperatingSystem(version: 16, type: .iPadOS))
print(computer.aboutDevice())

var systems: [OperatingSystem] = [
    OperatingSystem(version: 14, type: .iOS),
    OperatingSystem(version: 16, type: .iPadOS),
    OperatingSystem(version: 11, type: .macOS)
]

systems.forEach { print(ComputerFactory.makeComputer(system: $0).aboutDevice()) }



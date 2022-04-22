//
//  Configuration.swift
//  build-configurations
//
//  Created by Andrew on 2022-04-22.
//

import Foundation

enum Configuration: String {
    case debug
    case release
    
    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
        }
        
        guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Configuration")
        }
        
        return configuration
    }()
}

extension Configuration {
    static var baseURL: String {
        switch current {
        case .debug:
            return "https://google.com"
        case .release:
            return "https://apple.com"
        }
    }
}

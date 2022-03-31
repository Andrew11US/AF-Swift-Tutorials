//
//  HomeString.swift
//  Localization Demo
//
//  Created by Andrew on 2022-03-15.
//

import Foundation

enum HomeString: String {
    case buttonTitle
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
    
    func getLocalized() -> String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
}

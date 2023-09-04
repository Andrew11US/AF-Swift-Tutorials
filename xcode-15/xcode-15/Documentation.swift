//
//  Documentation.swift
//  xcode-15
//
//  Created by Andrew on 2023-09-03.
//

import Foundation

/// Sample struct to test document preview
struct SampleStruct {
    /// Person name
    var name: String
    
    /// Function to print greeting
    /// - Parameters:
    /// - name: name of a person to greet
    /// - count: number of times to repeat greeting
    func greet(name: String, count: Int) {
        for _ in 0..<count {
            print("Hello, \(name)!")
        }
    }
}

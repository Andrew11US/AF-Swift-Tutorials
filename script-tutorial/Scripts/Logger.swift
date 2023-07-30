//
//  Logger.swift
//  script-tutorial
//
//  Created by Andrew on 2023-07-30.
//

import Foundation

@main
enum Logger {
    static func main() {
        if let value = ProcessInfo.processInfo.environment["PRODUCT_NAME"] {
          print("Product Name: \(value)")
        }

        if let value = ProcessInfo.processInfo.environment["CONFIGURATION"] {
          print("Current config is: \(value)")
        }
    }
}

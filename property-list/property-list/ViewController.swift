//
//  ViewController.swift
//  property-list
//
//  Created by Andrew on 2023-08-10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let plistPath = Bundle.main.path(forResource: "tutorial-list", ofType: "plist"),
              let plistData = FileManager.default.contents(atPath: plistPath) else {
            return
        }

        do {
            if let dictionary = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] {
                // You now have the plist data in the 'dictionary' variable.
                // You can access specific values using dictionary[key].
                
                if let value = dictionary["number"] as? Int {
                    print("Value for 'SomeKey': \(value)")
                }
            }
        } catch {
            print("Error loading plist: \(error)")
        }
    }


}


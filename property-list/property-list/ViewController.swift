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
        readPropertyList()
    }

    private func readPropertyList() {
        guard let path = Bundle.main.path(forResource: "tutorial-list", ofType: "plist") else {
            print("Path for resource is incorrect")
            return
        }
        
        guard let data = FileManager.default.contents(atPath: path) else {
            print("Data conversion failed")
            return
        }
        
        do {
            let propertyList = try PropertyListSerialization.propertyList(from: data, format: nil)
            guard let dict = propertyList as? [String: Any] else {
                print("Dictionary casting failed")
                return
            }
            
            // Root
            if let value = dict["number"] as? Int {
                print("Number: \(value)")
            }
            
            // Dictionary
            if let dictionary = dict["dictionary-items"] as? [String: Any] {
                if let item = dictionary["X1"] as? String {
                    print("Dictionary item: \(item)")
                }
            }
            
            // Array
            if let array = dict["array-items"] as? [Any] {
                if let item = array[0] as? String {
                    print("Array item: \(item)")
                }
            }
        } catch let error {
            print("Error serializing plist: \(error.localizedDescription)")
        }
    }
}


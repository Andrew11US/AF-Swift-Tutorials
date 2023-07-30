//
//  IncrementBuildNumber.swift
//  script-tutorial
//
//  Created by Andrew on 2023-07-29.
//

import Foundation

@main
enum IncrementBuildNumber {
    static func main() {
        print("Script started")
        guard let infoFile = ProcessInfo.processInfo.environment["INFOPLIST_FILE"] else {
            print("info.plist file not found")
            return
        }
        guard let projectDir = ProcessInfo.processInfo.environment["SRCROOT"] else { return }
        
        if var dict = NSDictionary(contentsOfFile: projectDir + "/" + infoFile) as? [String: Any] {
            guard let currentVersionString = dict["CFBundleShortVersionString"] as? String,
                  let currentBuildNumberString = dict["CFBundleVersion"] as? String,
                  let currentBuildNumber = Int(currentBuildNumberString)
            else { return }
            
            dict["CFBundleVersion"] = "\(currentBuildNumber + 1)"
            print("New build number: \(dict["CFBundleVersion"])")
            
            if ProcessInfo.processInfo.environment["CONFIGURATION"] == "Release" {
                var versionComponents = currentVersionString.components(separatedBy: ".")
                let lastComponent = Int(versionComponents.last ?? "1") ?? 1
                versionComponents[versionComponents.endIndex - 1] = "\(lastComponent + 1)"
                dict["CFBundleShortVersionString"] = versionComponents.joined(separator: ".")
                print("New ShortVersionString: \(dict["CFBundleShortVersionString"])")
            }
            
            (dict as NSDictionary).write(toFile: projectDir + "/" + infoFile, atomically: true)
        }
    }
}

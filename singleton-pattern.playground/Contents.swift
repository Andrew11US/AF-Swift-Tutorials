import UIKit

struct Logger {
    static let shared = Logger()
    
    private init() {}
    
    func log(message: String) {
        print("# >> \(message)")
    }
}

Logger.shared.log(message: "Hello World")

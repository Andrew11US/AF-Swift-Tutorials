import UIKit

class Prefs {
    private let defaults = UserDefaults.standard
    static let shared = Prefs()
    
    private init() {}
    
    private enum Keys: String {
        case testInt
        case testString
    }
    
    var testInt: Int {
        get { defaults.integer(forKey: Keys.testInt.rawValue) }
        set { defaults.set(newValue, forKey: Keys.testInt.rawValue) }
    }
    
    var testString: String {
        get { defaults.string(forKey: Keys.testString.rawValue) ?? "" }
        set { defaults.set(newValue, forKey: Keys.testString.rawValue) }
    }
}

Prefs.shared.testInt = 10
Prefs.shared.testInt


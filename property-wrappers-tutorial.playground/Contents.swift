import UIKit

@propertyWrapper
struct NonZero {
    private var number = 0
    
    var wrappedValue: Int {
        get { number }
        set { number = newValue >= 0 ? newValue : 0 }
    }
}

@propertyWrapper
struct Capitalized {
    private var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
}

struct User {
    @Capitalized var name: String
    @NonZero var age: Int
}

var user: User = User()
user.name = "stan"
user.age = -45
print(user.name, user.age)

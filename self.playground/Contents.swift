import UIKit

struct Person {
    let name: String
    
    init(name: String) {
        // self - refers to the object itself i.e. instance of a Person
        self.name = name
    }
    
    var objectString: String {
        // Self - refers to the type itself i.e. Person type
        return String(describing: Self.self)
    }
}

print(Person(name: "Alice").objectString)

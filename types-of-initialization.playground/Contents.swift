import UIKit
/*:
  * Note:
 Initializers are methods that create and initialize instances
 */

// Default Initializers
class Default {
    init() { }
}

// Memberwise Initializers
struct Point {
    var x: Int
    var y: Int
}

let point = Point(x: 10, y: 20)

// Custom Initializers
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = Person(name: "Tim", age: 30)

// Required Initializers
class Vehicle {
    var wheels: Int

    init(wheels: Int) {
        self.wheels = wheels
    }
}

class Car: Vehicle {
    var brand: String

    required init(wheels: Int) {
        self.brand = "Unknown"
        super.init(wheels: wheels)
    }

    init(brand: String, wheels: Int) {
        self.brand = brand
        super.init(wheels: wheels)
    }
}


// Failable Initializers
struct Temperature {
    var celsius: Double

    init?(celsius: Double) {
        if celsius < -273.15 {
            return nil
        }
        self.celsius = celsius
    }
}

let validTemperature = Temperature(celsius: 25.0)
let invalidTemperature = Temperature(celsius: -300.0) // Returns nil


// Convenience Initializers
class Rectangle {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    convenience init(side: Double) {
        self.init(width: side, height: side)
    }
}

let rect = Rectangle(side: 10.0)

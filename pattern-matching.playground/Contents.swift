import UIKit
/*:
  * Note:
 Pattern matching in Swift is a language feature that allows you to match the values of variables or expressions against specific patterns.
 */

// Wildcard pattern
for _ in 1...3 {
    print("Hello playground")
}


// Identifier pattern
let name = "Tony Stark"
let _ = saveData()


// Value-binding pattern
let coordinate = (5, -3)

switch coordinate {
case let (x, _) where x > 10:
  print("X axis value: \(x)")
default:
    print("unknown")
}


// Tuple pattern
let coordinates = [(1, 1), (2, 2), (5, 5), (7, 5), (9, 2), (3, 5)]

for (x, y) in coordinates where y > 5 {
  // Only iterate over the values that have a 5 in the `y` position.
}


// Enumeration Case Pattern
enum MyEnum {
    case caseA(Int)
    case caseB(String)
    case caseC
}

let value = MyEnum.caseB("Hello")

switch value {
case .caseA(let number):
    print("Value is an integer: \(number)")
case .caseB(let string):
    print("Value is a string: \(string)")
case .caseC:
    print("Value is caseC")
}


// Optional Pattern
let possibleInt: Int? = 97

if case .some(let value) = possibleInt {
  print(value)
}

if case let value? = possibleInt {
  print(value)
}


// Type-Casting Pattern
class Vehicle {}

class Car: Vehicle {
    let wheels: Int
    let size: Int
    
    init(wheels: Int, size: Int) {
        self.wheels = wheels
        self.size = size
    }
}

class Airplane: Vehicle {
    let wings: Int
    let capacity: Int
    
    init(wings: Int, capacity: Int) {
        self.wings = wings
        self.capacity = capacity
    }
}

func makeVehicle() -> Vehicle {
    Airplane(wings: 2, capacity: 200)
}

let aVehicle = makeVehicle()

switch aVehicle {
case is Car:
    print("The vehicle is a car")
case is Airplane:
    print("The vehicle is an airplane")
default:
    print("unknown vehicle")
}


// Expression Pattern
let point = (1, 1)

switch point {
case (-5...5, -5...5):
    print("Both coordinates are within the same range. x is \(point.0) and y is \(point.1)")
default:
    print("no matches")
}

import UIKit

// Closure Expressions
let addNumbers1: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

let addNumbers2: (Int, Int) -> Int = { (a, b) in return a + b }

let addNumbers3: (Int, Int) -> Int = { a, b in a + b }

let addNumbers4: (Int, Int) -> Int = { $0 + $1 }

addNumbers1(1, 5)
addNumbers2(2, 7)
addNumbers3(3, 4)
addNumbers4(4, 1)


// Trailing Closures
var numbers = [9, 3, 1, 2, 0]
numbers.sorted { $0 < $1 }


// Capture Values
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo())
print(incrementByTwo())


// Auto Closures
func performOperation(using closure: @autoclosure () -> Bool) {
    if closure() {
        print("Operation succeeded")
    } else {
        print("Operation failed")
    }
}

performOperation(using: 2 > 1)


// Escaping Closures
func getDataFromAPI(url: String, completion: @escaping (String) -> Void) {
    guard let url = URL(string: url) else {
        print("Invalid URL")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            return
        }

        guard let data = data else {
            print("No data received")
            return
        }

        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            if let dictionary = jsonObject as? [String: Any] {
                completion("\(dictionary)")
            }
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
        }
    }

    task.resume()
}

getDataFromAPI(url: "https://jsonplaceholder.typicode.com/todos/1") { value in
    print("Escaping closure: \(value)")
}


// Non-Escaping Closures
func execute(closure: () -> Void) {
    closure()
}

execute {
    print("Non-Escaping closure executed")
}

import UIKit

// MARK: SE-0380 - if and switch expressions

let number = 2

let result = if number % 2 == 0 { "Even" } else { "Odd" }

let switchResult = switch number {
case 0...10: "From 0 to 10"
case 11...20: "From 11 to 20"
case 21...30: "From 21 to 30"
default: "Out of range"
}


// MARK: SE-0393, SE-0398, and SE-0399 - Value and Type Parameter Packs

struct Grade1 {
    var name: String
}

struct Grade2 {
    var name: String
}

func pairUpStudents<T, U>(list1: T..., list2: U...) -> ([(T, U)]) {
    assert(list1.count == list2.count, "You must provide equal numbers of students to pair.")
    var pairs: [(T, U)] = []

    for i in 0..<list1.count {
        pairs.append((list1[i], list2[i]))
    }

    return pairs
}

pairUpStudents(list1: Grade1(name: "Tom"), Grade1(name: "Alice"), list2: Grade2(name: "Bob"), Grade2(name: "Alex"))


// MARK: SE-0382, SE-0389, and SE-0397 - Macros

// @freestanding(expression)
// public macro URL(_ stringLiteral: String) -> URL = #externalMacro(module: "MyMacrosPlugin", type: "URLMacro")
//
// let url = #URL("https://swift.org")


// MARK: SE-0390 - Noncopyable structs and enums

struct User: ~Copyable {
    var name: String
}


// MARK: SE-0388 - Convenience Async[Throwing]Stream.makeStream methods

var continuation: AsyncStream<String>.Continuation!
let stream = AsyncStream<String> { continuation = $0 }

let (stream1, continuation1) = AsyncStream.makeStream(of: String.self)


// MARK: SE-0374 - Add sleep(for:) to Clock

try await Task.sleep(for: .seconds(1), tolerance: .seconds(0.5))

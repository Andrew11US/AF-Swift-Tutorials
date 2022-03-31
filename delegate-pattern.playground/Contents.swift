import UIKit

protocol Work {
    func sing(song: String) -> String
}

struct Boss {
    var delegate: Work?
}

struct Employee: Work {
    func sing(song: String) -> String {
        "I'm singing \(song)!"
    }
}

var boss = Boss()
var john = Employee()
boss.delegate = john
boss.delegate?.sing(song: "Peaches")

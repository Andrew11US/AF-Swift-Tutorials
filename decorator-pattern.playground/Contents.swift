import UIKit

protocol Car {
    var upgrades: [String] { get }
    var price: Int { get }
}

protocol CarDecorator: Car {
    var car: Car { get }
}

struct BaseCar: Car {
    var upgrades: [String] = ["Engine"]
    var price: Int = 10_000
}

struct BaseWheels: CarDecorator {
    var car: Car
    
    var upgrades: [String] {
        car.upgrades + ["Base Wheels"]
    }
    
    var price: Int {
        car.price + 1_000
    }
}

struct SportWheels: CarDecorator {
    var car: Car
    
    var upgrades: [String] {
        car.upgrades + ["Sport Wheels"]
    }
    
    var price: Int {
        car.price + 3_000
    }
}

struct AirCondition: CarDecorator {
    var car: Car
    
    var upgrades: [String] {
        car.upgrades + ["Air Condition"]
    }
    
    var price: Int {
        car.price + 2_000
    }
}

struct Autopilot: CarDecorator {
    var car: Car
    
    var upgrades: [String] {
        car.upgrades + ["Autopilot"]
    }
    
    var price: Int {
        car.price + 5_000
    }
}

var car = BaseCar()
car.price
var sportCar = SportWheels(car: car)
sportCar.price
var acCar = AirCondition(car: sportCar)
acCar.price
var autopilotCar = Autopilot(car: acCar)
autopilotCar.price
autopilotCar.upgrades.forEach { print($0) }

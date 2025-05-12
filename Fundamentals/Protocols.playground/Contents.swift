import Foundation

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        "I'm driving \(distance)km."
    }
    
    func openSunroof() {
        "It's a nice day!"
    }
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        "I'm driving \(distance)km."
    }
    
    func openSunroof() {
        "It's a nice day!"
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        "That's too slow! I'll try a different vehicle."
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bicycle = Bicycle()
commute(distance: 50, using: bicycle)


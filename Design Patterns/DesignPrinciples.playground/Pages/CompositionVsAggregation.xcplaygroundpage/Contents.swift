import Foundation

// MARK: - COMPOSITION EXAMPLE
// Composition is a strong ownership relationship.
// The part (Engine) is fully managed by the whole (Car).
// This ensures tight control but limits flexibility.

struct Engine {
    func start() {
        print("Engine started")
    }
}

struct Car {
    // PRO: The engine is tightly encapsulated inside the Car.
    // CON: You cannot reuse or swap the Engine once Car is created.
    //      Also hard to unit-test Engine in isolation.
    private let engine = Engine()

    func start() {
        engine.start()
        print("Car is running")
    }
}

// Usage of Composition
let car = Car()
car.start()

// 🔴 PROBLEM: You can't reuse the engine elsewhere.
// Example (won't compile):
// let reusedEngine = car.engine // ❌ engine is private and bound to Car
// If Engine needed customization or injection, you’d need to redesign Car.


// MARK: - AGGREGATION EXAMPLE
// Aggregation is a weak ownership relationship.
// The whole (Driver) uses the part (Car), but doesn’t own it.
// This allows sharing and decoupling, but comes with risks.

struct SharedCar {
    func start() {
        print("SharedCar is running")
    }
}

struct Driver {
    // PRO: Car can be injected (good for testing, flexibility).
    // CON: Driver depends on an external object staying valid.
    let name: String
    let car: SharedCar

    func drive() {
        car.start()
        print("\(name) is driving the car")
    }
}

// Shared instance
let sharedCar = SharedCar()

let driver1 = Driver(name: "Max", car: sharedCar)
let driver2 = Driver(name: "Luca", car: sharedCar)

driver1.drive()
driver2.drive()

// 🔴 POTENTIAL PROBLEM:
// If the car is deallocated or changed externally, drivers are affected.
// Imagine this was a class reference to a shared mutable object — leads to bugs!

// EXAMPLE (hypothetical):
// sharedCar.breakDown()
// driver1.drive() // 💥 Unexpected behavior or crash if car is no longer usable

// Also, if driver expects car to always work, but someone else modifies it:
// driver2.car = nil // ❌ if using class & optional references, this becomes unsafe


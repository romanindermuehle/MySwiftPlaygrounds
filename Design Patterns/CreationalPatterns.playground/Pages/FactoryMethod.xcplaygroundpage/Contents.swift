//: [Previous](@previous)

import Foundation

protocol Product: Sendable {
    func hasScreen() -> Bool
    func hasBattery() -> Bool
}

final class iPhone: Product {
    func hasScreen() -> Bool {
        true
    }
    
    func hasBattery() -> Bool {
        true
    }
}

final class MacBook: Product {
    func hasScreen() -> Bool {
        true
    }
    
    func hasBattery() -> Bool {
        true
    }
}

protocol Factory {
    func buildProduct() async -> Product
}

class iPhoneFactory: Factory {
    func buildProduct() -> Product {
        iPhone()
    }
}

class MacBookFactory: Factory {
    func buildProduct() -> Product {
        MacBook()
    }
}

actor Apple: Factory {
    let factory = iPhoneFactory()
    
    func buildProduct() async -> Product {
        factory.buildProduct()
    }
}

Task {
    let a = Apple()
    await a.buildProduct()
}
//: [Next](@next)

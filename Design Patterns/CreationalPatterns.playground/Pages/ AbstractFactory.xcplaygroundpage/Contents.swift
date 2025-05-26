//: [Previous](@previous)

import Foundation

protocol Chair: CustomStringConvertible {
    func canSitOn() -> Bool
    func hasLegs() -> Bool
}

protocol Sofa: CustomStringConvertible {
    func canSitOn() -> Bool
    func hasLegs() -> Bool
}

class ModernChair: Chair {
    func canSitOn() -> Bool {
        return true
    }
    
    func hasLegs() -> Bool {
        return true
    }
    
    var description: String {
        return "ModernChair(canSitOn: \(canSitOn()), hasLegs: \(hasLegs()))"
    }
}

class ClassicChair: Chair {
    func canSitOn() -> Bool {
        return false
    }
    
    func hasLegs() -> Bool {
        return false
    }
    
    var description: String {
        return "ModernChair(canSitOn: \(canSitOn()), hasLegs: \(hasLegs()))"
    }
}

class ModernSofa: Sofa {
    func canSitOn() -> Bool {
        return true
    }
    
    func hasLegs() -> Bool {
        return true
    }
    
    var description: String {
        return "ModernSofa(canSitOn: \(canSitOn()), hasLegs: \(hasLegs()))"
    }
}

protocol Factory {
    func createChair() -> Chair
    func createSofa() -> Sofa
}

class ModernFactory: Factory {
    func createChair() -> Chair {
        return ModernChair()
    }
    
    func createSofa() -> Sofa {
        return ModernSofa()
    }
}

let modernFactory = ModernFactory()

modernFactory.createChair()
modernFactory.createSofa()


//: [Next](@next)

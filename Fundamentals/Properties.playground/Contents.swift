import Foundation

// MARK: Get/Set

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
            "This is the new value: \(newValue)"
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
archer.vacationAllocated

// MARK: WillSet/DidSet

struct App {
    var contacts = [String]() {
        willSet {
            "Current value is: \(contacts)"
            "New value will be: \(newValue)"
        }
        
        didSet {
            "There are now \(contacts.count) contacts."
            "Old value was \(oldValue)"
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")







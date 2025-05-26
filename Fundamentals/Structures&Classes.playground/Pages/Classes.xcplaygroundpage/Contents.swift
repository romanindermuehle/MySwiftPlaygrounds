import Foundation

class Game {
    var score = 0 {
        didSet {
            "Score is now \(score)"
        }
    }
}

var newGame = Game()
newGame.score += 10

// MARK: Class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        "I work \(hours) hours a day."
    }
}

class Developer: Employee {
    func work() {
        "I'm writing code for \(hours) hours."
    }
    
    override func printSummary() {
        "I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours aguing about whether code should be indented using tabs or spaces."
    }
}

class Manager: Employee {
    func work() {
        "I'm going to meetings for \(hours) hours."
    }
}

let robert = Developer(hours: 8)
let tim = Manager(hours: 10)
robert.work()
tim.work()

let novall = Developer(hours: 8)
novall.printSummary()

// MARK: Initializers for classes

class Vehicle {
    let isElectric: Bool
    let seats: Int
    
    init(isElectric: Bool, seats: Int) {
        self.isElectric = isElectric
        self.seats = seats
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool, seats: Int) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric, seats: seats)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false, seats: 4)


// MARK: Copy classes

class Account {
    var username = "Anonymous"
}

var account1 = Account()
var account2 = account1
account2.username = "Taylor"

account1.username
account2.username

// MARK: Deinitializer for a class

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        "User \(id): I'm alive!"
    }
    
    deinit {
        "User \(id): I'm dead!"
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    "User \(user.id): I'm in control!"
    users.append(user)
}

"Loop is finished!"
users.remove(at: 0)
users.removeAll()
"Array is clear!"

// MARK: Work with variables inside classes

class Pet {
    var name = "Paul"
}

let pet = Pet()
pet.name = "Taylor"

// MARK: What is meant by "reference type"?

class Cat {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let catClass = Cat(name: "Timo", age: 4)
let catClassCopy = catClass

// Reference type means all class instances share the same data.
catClass.age = 2

catClassCopy.age

//: [Next](@next)

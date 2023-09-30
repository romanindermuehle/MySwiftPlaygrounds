import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// MARK: class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours aguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let tim = Manager(hours: 10)
robert.work()
tim.work()

let novall = Developer(hours: 8)
novall.printSummary()


// MARK: initializers for classes

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


// MARK: copy classes

//class User {
//    var username = "Anonymous"
//}
//
//var user1 = User()
//var user2 = user1
//user2.username = "Taylor"
//
//print(user1.username)
//print(user2.username)



// MARK: deinitializer for a class

//class User {
//    let id: Int
//    
//    init(id: Int) {
//        self.id = id
//        print("User \(id): I'm alive!")
//    }
//    
//    deinit {
//        print("User \(id): I'm dead!")
//    }
//}
//
//var users = [User]()
//
//for i in 1...3 {
//    let user = User(id: i)
//    print("User \(user.id): I'm in control!")
//    users.append(user)
//}
//
//print("Loop is finished!")
//users.remove(at: 0)
//users.removeAll()
//print("Array is clear!")


// MARK: work with variables inside classes

class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)



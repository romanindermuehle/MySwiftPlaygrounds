import Foundation

// MARK: Internal level

// Error: Cannot find 'Device' in scope
// Meaning: Due to the 'internal' protection level (default) I'm not able to access this class.
// Code: let device = Device()

// MARK: Private level

private class Student {
    private var age: Int
    private var className: String
    
    private init(age: Int, className: String) {
        self.age = age
        self.className = className
    }
}

// Error: 'Student' initializer is inaccessible due to 'private' protection level
// Code: let student = Student(age: 18, className: "INF2022K")

// MARK: Public level

// Remember: Because of the 'public' protection level, I can access this class from another module. However, inheritance is not possible. To do that, the class needs to be set to 'open', as shown in the example below.
let account = Account(username: "iUser")

// MARK: Open level

let animal = Animal(name: "Timo", age: 3)

class Cat: Animal {
    var ownerName: String
    
    init(name: String, age: Int, ownerName: String) {
        self.ownerName = ownerName
        super.init(name: name, age: age)
    }
    
    override func getName() -> String {
        ownerName
    }
}

let cat = Cat(name: "Leo", age: 4, ownerName: "Luca")

cat.getName()





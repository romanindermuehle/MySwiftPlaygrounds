import Foundation

protocol Pet {
    var name: String { get }
    var age: Int { get }
}

struct Cat: Pet {
    let name: String
    let age: Int
    let sound: String
}

struct Dog: Pet {
    var name: String
    var age: Int
}

let cats = [Cat(name: "Timo", age: 2, sound: ""), Cat(name: "Jan", age: 5, sound: ""), Cat(name: "Lucas", age: 3, sound: "")]
let dogs = [Dog(name: "Andrea", age: 8), Dog(name: "Max", age: 3), Dog(name: "Andy", age: 2)]

// MARK: Option 1

func callPets<T: Pet>(pets: [T]) {
    pets.forEach { print($0) }
}

// MARK: Option 2

func callPets2(pets: [some Pet]) {
    pets.forEach { print($0) }
}

callPets(pets: cats)
callPets2(pets: dogs)


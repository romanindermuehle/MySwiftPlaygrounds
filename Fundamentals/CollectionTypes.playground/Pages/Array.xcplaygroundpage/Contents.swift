import Foundation

// MARK: Basic Array operations

var myArray = ["Tim", "Daniel", "Jessica", "Kevin"]

@MainActor
func addEntery() {
    let name = "Test"
    myArray.append(name)
    print(myArray)
}

myArray[1]
myArray.count

addEntery()

myArray.append("Justine")
myArray.count

myArray.isEmpty

myArray.contains("Tim")

myArray.last ?? "Unknown"

myArray.remove(at: 1)
myArray.count

myArray.removeAll()
myArray.count

// MARK: Map

let strings = ["John", "Paul", "George", "Ringo"]
let uppercased = strings.map { $0.uppercased() }

print(uppercased)

// MARK: Filter

struct Product {
    let name: String
    var isExpired: Bool
}

let products: [Product] = [Product(name: "Milk", isExpired: false), Product(name: "Bread", isExpired: true), Product(name: "Banana", isExpired: true), Product(name: "Cookie", isExpired: false)]

let filteredProducts1 = products.filter { product in
    product.isExpired == true
}

let filteredProducts2 = products.filter { $0.isExpired == true }

let filteredProducts3 = products.filter(\.isExpired)

filteredProducts1.forEach { product in
    print(product)
}

filteredProducts2.forEach { product in
    print(product)
}

filteredProducts3.forEach { print($0) }

// MARK: For-In/ForEach

let ships = [
    "Star Trek": "Enterprise",
    "Firefly": "Serenity",
    "Aliens": "Sulaco"
]


for ship in ships {
    print("\(ship.value) is from \(ship.key)")
}

for ship in ships.reversed() {
    print("\(ship.value) is from \(ship.key)")
}

for (index, ship) in ships.enumerated() {
    print("\(index + 1). \(ship.value) is from \(ship.key)")
}

// this will count down from 3 to 1

for (index, ship) in ships.enumerated().reversed() {
    print("\(index + 1). \(ship.value) is from \(ship.key)")
}


// this will count up from 1 to 3

for (index, ship) in ships.reversed().enumerated() {
    print("\(index + 1). \(ship.value) is from \(ship.key)")
}


ships.forEach {
    print("\($0.value) is from \($0.key)")
}


func calculateFactors(_ number: Int) {
    let factors = (1...number).filter { number % $0 == 0 }
    let stringFactors = factors.map { String($0) }
    let joinedFactors = stringFactors.joined(separator: ", ")
    print("Factors of \(number): \(joinedFactors)")
}

(1...100).forEach(calculateFactors)

//: [Next](@next)

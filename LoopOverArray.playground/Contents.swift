import Foundation

let ships = [
    "Star Trek": "Enterprise",
    "Firefly": "Serenity",
    "Aliens": "Sulaco"
]


for ship in ships {
    print("\(ship.value) is from \(ship.key)")
}

//for ship in ships.reversed() {
//    print("\(ship.value) is from \(ship.key)")
//}
//
//for (index, ship) in ships.enumerated() {
//    print("\(index + 1). \(ship.value) is from \(ship.key)")
//}
//
//// this will count down from 3 to 1
//
//for (index, ship) in ships.enumerated().reversed() {
//    print("\(index + 1). \(ship.value) is from \(ship.key)")
//}
//
//
//// this will count up from 1 to 3
//
//for (index, ship) in ships.reversed().enumerated() {
//    print("\(index + 1). \(ship.value) is from \(ship.key)")
//}
//
//
//ships.forEach {
//    print("\($0.value) is from \($0.key)")
//}
//
//public func forEach(_ body: (Element) throws -> Void) rethrows {
//    for element in self {
//        try body(element)
//    }
//}
//
//
//func calculateFactors(_ number: Int) {
//    let factors = (1...number).filter { number % $0 == 0 }
//    let stringFactors = factors.map { String($0) }
//    let joinedFactors = stringFactors.joined(separator: ", ")
//    print("Factors of \(number): \(joinedFactors)")
//}
//
//(1...100).forEach(calculateFactors)

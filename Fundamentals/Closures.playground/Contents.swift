import Foundation
import SwiftUI

// MARK: Closure with return value

let addClosure = { (a, b) -> Int in
    return a + b
}

let resultFromClosure = addClosure(7, 2)
print(resultFromClosure)

// Same but different syntax

let sumClosure: (Int, Int) -> Int = { (a, b) in
    a + b
}
let closureAnswer = sumClosure(9, 5)
print(closureAnswer)

// MARK: Filter
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter { (name: String) -> Bool in
    print(name)
    return name.hasPrefix("T")
}

print(onlyT)


let onlyT2 = team.filter({ $0.hasPrefix("T") })
print(onlyT2.count)

// MARK: Map

func operateOnArray(numbers: [Int], operation: (Int) -> Int) -> [Int] {
    // The operation closure is applied to each element of the array
    return numbers.map(operation)
}

let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = operateOnArray(numbers: numbers) {
    return $0 * $0
}

print(squaredNumbers)  // Output: [1, 4, 9, 16, 25]

extension Array {
    func myMap(_ transform: (Element) -> Element) -> Array {
        var result = [Element]()
        
        self.forEach { result.append(transform($0)) }
        
        return result
    }
}

let names = ["Lena", "Tim", "Lukas", "Leo"]

numbers.myMap {
    $0 * 100
}

names.myMap {
    String($0.dropLast())
}

// MARK: SwiftUI

struct myView: View {
    var body: some View {
        Button {
            print("Test")
        } label: {
            Text("Test")
        }
    }
}

// MARK: Capturing Values

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

var incrementByFifteen = makeIncrementer(forIncrement: 15)

incrementByFifteen()

incrementByFifteen()

incrementByFifteen()

incrementByFifteen()

// MARK: Closures as Function Parameters

func sayHello(to name: String, finallySayIt: (String) -> ()) {
    let newName = name.uppercased()
    finallySayIt(newName)
}

// Option 1
sayHello(to: "Stewart", finallySayIt: { name in
    print("Hello \(name)")
})

// Option 2
sayHello(to: "Stewart") { (name) in
    print("Hello \(name)")
}

// Option 3
let reallySayIt: (String) -> () = { name in
    print("Hello \(name)")
}

sayHello(to: "Stewart", finallySayIt: reallySayIt)

// MARK: Function returning a closure

func sayIt() -> (String) -> Void {
    return { name in
        print("Hello \(name)")
    }
}

//    sayIt()("Stewart")
let greetings = sayIt()
greetings("Stewart")


// MARK: Escaping Trailing Closure

@MainActor
func sayHello2(to name: String, finallySayIt: @escaping (String) -> ()) {
    let newName = name.uppercased()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        finallySayIt(newName)
    }
}

sayHello2(to: "Stewart") { (name) in
    print("Hello \(name)")
}




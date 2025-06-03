//: [Previous](@previous)

// 1. Basic protocol/interface for the product
protocol Beverage {
    var cost: Double { get }
    var description: String { get }
}

// 2. Concrete component
class SimpleCoffee: Beverage {
    var cost: Double { 2.0 }
    var description: String { "Coffee" }
}

// 3. Decorator base class
class BeverageDecorator: Beverage {
    private let wrapped: Beverage
    init(_ beverage: Beverage) { self.wrapped = beverage }
    var cost: Double { wrapped.cost }
    var description: String { wrapped.description }
}

// 4. Specific decorators
class MilkDecorator: BeverageDecorator {
    override var cost: Double { super.cost + 0.5 }
    override var description: String { super.description + ", milk" }
}

class SugarDecorator: BeverageDecorator {
    override var cost: Double { super.cost + 0.2 }
    override var description: String { super.description + ", sugar" }
}

// 5. Usage
var myCoffee: Beverage = SimpleCoffee()
myCoffee = MilkDecorator(myCoffee)
myCoffee = SugarDecorator(myCoffee)

print(myCoffee.description) // Output: Coffee, milk, sugar
print("Total price: \(myCoffee.cost) €")  // Output: Total price: 2.7 €


//: [Next](@next)

import SwiftUI
import Foundation


// Use "some" and "any" ONLY together with protocols!


// Some is used with protocol's that contain associated types!
// ✅ Use some when:
//    •    You are returning a single, specific type that conforms to a protocol.
//    •    You want performance and type safety.
//    •    You don’t need to switch types behind the scenes

class A {
    func makeView() -> some View {
        Text("Hello, world!")
    }
    
    func makeView2() -> any View {
        Text("Hello, world!")
    }
}

let a = A()
let text = a.makeView()
print("Type of x is: \(type(of: text))")



// Note: Use "some" to get rid of type details for the caller but the compiler will still
// use it to do static dispatch.



// Use "any" to earase type information i.e. to store heterogenous types in a variable
// ✅ Use any when:
//    •    You need to store heterogeneous types in a variable or collection.
//    •    The actual type can vary at runtime.
//    •    You need to work with type-erased protocols!!!

let shapes: [any Shape] = [Circle(), Rectangle()]


// Rule of Thumb:
//    •    If you can stick to one concrete type, use "some" — it’s faster and safer.
//    •    If you need flexibility, go with any.



// What does opaque type mean in Swift?
// “A type that conforms to a protocol, but the actual concrete type is hidden from the caller.”
// You declare it using the some keyword!!!
//
// Think of it like this:
// “I promise to return something that acts like a View (or any protocol), but I’m not telling you what exact type it is.”

// ✨ What makes it cool?
//    •    Static dispatch (faster than any)
//    •    Type safety (you know the compiler knows the type, even if you don’t)
//    •    Great for hiding implementation details


// ❌ Limitation
//
// You must return the same concrete type every time. This will not compile:

/*
 func makeThing(_ flag: Bool) -> some Equatable {
 if flag {
 return 42       // Int
 } else {
 return "hello"  // String ❌ different type
 }
 }
 */

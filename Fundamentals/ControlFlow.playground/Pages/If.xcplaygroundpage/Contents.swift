import Foundation

let a = false
let b = true

if a == true {
    "successful"
} else if b == true {
    "successful"
} else {
    "Something went wrong!"
}


// MARK: AND
let temp = 25

if temp > 20 && temp < 30 {
    "It's a nice day."
}


// MARK: OR
let userAge = 14
let hasParentalConsent = true


if userAge >= 18 || hasParentalConsent {
    "You can buy the game!"
}


enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane


if transport == .airplane || transport == .helicopter {
    "Let's fly!"
} else if transport == .bicycle {
    "I hope there's a bike path..."
} else if transport == .car {
    "Time to get stuck in traffic."
} else {
    "I'm going to hire a scooter now!"
}

//: [Next](@next)

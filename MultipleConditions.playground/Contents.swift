import Foundation

let a = false
let b = true

if a == true {
    print("successful")
} else if b == true {
    print("successful")
} else {
    print("Something went wrong!")
}


//And
let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}


//OR
let userAge = 14
let hasParentalConsent = true


if userAge >= 18 || hasParentalConsent {
    print("You can buy the game!")
}


enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane


if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

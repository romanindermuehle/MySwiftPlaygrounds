import Foundation

let letter1 = "A"
let letter2 = "B"

if letter1 < letter2 {
    print("A kommt vor B")
} else {
    print("B kommt vor A")
}



let friendsName = "Tim"
let myName = "Roman"

if friendsName < myName {
    print("\(friendsName) vs \(myName)")
} else {
    print("Es ist umgekehrt!!!")
}


var names = ["Roman", "Tim", "Ted"]
names.append("Luca")

if names.count > 3 {
    names.remove(at: 0)
}
print(names)


let country = "Switzerland"

if country == "Australia" {
    print("Nice to meet you :-D")
}

if country != "Germany" {
    print("Your not from Germany. You're from \(country).")
}


var username = "ir"

if username.isEmpty {
    username = "Anonymous"
}
print("Welcome, \(username)")

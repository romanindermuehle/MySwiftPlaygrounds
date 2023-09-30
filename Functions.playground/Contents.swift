import Cocoa

var name1 = "abc"
var name2 = "cba"

func checkString(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

checkString(string1: name1, string2: name2)
 

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}


//let c = pythagoras(a: 3, b: 4)
//print(c)


//func pythagoras(a: Double, b: Double) -> Double {
//     sqrt(a * a + b * b)
//}


let c = pythagoras(a: 3, b: 4)
print(c)


// return multiple values

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


// You can also write it like that

func getUser2() -> (String, String) {
    ("Taylor", "Swift")
}

let user2 = getUser2()
print("Name: \(user2.0) \(user2.1)")


// Or like that

func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let (firstName, lastName) = getUser3()
print("Name: \(firstName) \(lastName)")

// parameter labels

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)


func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)


func paintHouse(color: String) -> Bool {
    if color == "tartan" {
        return false
    } else {
        return true
    }
}


paintHouse(color: "orange")


let addClosure = { (a, b) -> Int in
    return a + b
}

let resultFromClosure = addClosure(7, 2)
print(resultFromClosure) // Ausgabe: 9


// MARK: Don't understand how this is working



let team = ["Anna", "Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)


let team2 = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam2 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}


let reverseTeam = team.sorted { $0 > $1 }

print(captainFirstTeam2)
print(reverseTeam)




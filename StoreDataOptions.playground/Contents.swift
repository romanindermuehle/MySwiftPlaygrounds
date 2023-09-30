import Foundation
import SwiftUI

func addEntery() {
    let name = "Test"
    myArray.append(name)
    print(myArray)
}


//Array

var myArray = ["Tim", "Daniel", "Jessica", "Kevin"]

print(myArray[1])
print(myArray.count)

addEntery()

myArray.append("Justine")
print(myArray.count)

print(myArray.isEmpty)

print(myArray.contains("Tim"))

print(myArray.last ?? "Unknown")

myArray.remove(at: 1)
print(myArray.count)

myArray.removeAll()
print(myArray.count)



//Dictionarry

//var employee = [
//    "name": "Tim Cook",
//    "job": "CEO of Apple",
//    "workplace": "Apple Park"
//]
//
//
//print(employee["name"] ?? "Unknown")
//print(employee["job"] ?? "Unknown")
//print(employee["workplace"] ?? "Unknown")
//
//print(employee.count)
//
//
//var favAppleDevice = [
//    1: "MacBook Pro",
//    2: "iPhone"
//
//]
//
//favAppleDevice.updateValue("Apple Watch", forKey: 3)
//print(favAppleDevice.sorted(by: <))
//
//favAppleDevice.removeValue(forKey: 3)
//print(favAppleDevice.sorted(by: <))



//Set

//let actors: Set = ["Denzel Washingthon","Tom Cruise","Nicolas Cage","Samuel L Jackson"]
//print(actors)

//var actors = Set<String>()
//actors.insert("Denzel Washingthon")
//actors.insert("Tom Cruise")
//actors.insert("Nicolas Cage")
//actors.insert("Samuel L Jackson")
//print(actors)
//
//print(actors.count)
//
//print(actors.sorted())







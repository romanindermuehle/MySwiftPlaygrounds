//: [Previous](@previous)

import Foundation

// MARK: Read value for specific key

var employee = [
    "name": "Tim Cook",
    "job": "CEO of Apple",
    "workplace": "Apple Park"
]

employee["name"] ?? "Unknown"
employee["job"] ?? "Unknown"
employee["workplace"] ?? "Unknown"

employee.count

// MARK: Update/Sort/Remove

var favAppleDevice = [
    1: "MacBook Pro",
    2: "iPhone"
    
]

favAppleDevice.updateValue("Apple Watch", forKey: 3)
favAppleDevice.sorted(by: <)

favAppleDevice.removeValue(forKey: 3)
favAppleDevice.sorted(by: <)

// MARK: For-In/ForEach

var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

responseMessages[200]

func modifyValue(valueString: String) -> String {
    var Input = valueString
    
    // Replace String
    Input = Input.replacingOccurrences(of: "File not found", with: "Sorry I lost your file")
    
    // Replace String
    Input = Input.replacingOccurrences(of: "Internal server error", with: "Housten we have a problem")
    
    return Input
}

for (key, value) in responseMessages {
    "\(key) is known as the \(value)"
    modifyValue(valueString: value)
}


//: [Next](@next)

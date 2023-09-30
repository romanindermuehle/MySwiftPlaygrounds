import Foundation

let strings = ["John", "Paul", "George", "Ringo"]
let uppercased = strings.map { $0.uppercased() }

print(uppercased)

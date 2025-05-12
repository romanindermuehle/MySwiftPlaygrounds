import Foundation

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)

let author = book.author ?? "Anonymous"
author

var input = ""
input = "Hello"
let number = Int(input) ?? 0


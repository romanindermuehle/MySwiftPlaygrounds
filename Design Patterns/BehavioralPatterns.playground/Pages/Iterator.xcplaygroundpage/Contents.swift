//: [Previous](@previous)

import Foundation

struct Book {
    var author: String
    var name: String
}

struct Books {
    var category: String
    var books: [Book]
}

struct BooksIterator: IteratorProtocol {

    // MARK: - Properties
    
    private var current = 0
    private let books: [Book]

    // MARK: - Initializers
    
    init(books: [Book]) {
        self.books = books
    }

    // MARK: - Methods
    
    mutating func next() -> Book? {
        defer { current += 1 }
        return books.count > current ? books[current] : nil
    }
}

extension Books: Sequence {
    
    func makeIterator() -> BooksIterator {
        return BooksIterator(books: books)
    }
}

let gameOfOwls = Book(author: "King", name: "Game of Owls")
let candyFactory = Book(author: "Martin", name: "Candy Factory and Crazy Cat")

let books = Books(category: "Favorite Books", books: [gameOfOwls, candyFactory])

books.forEach { book in
    print(book)
}

// MARK: Simplified Iterator

// Because the type Array already confirms to Sequence we can simplify it more.
/*
extension Books: Sequence {

    func makeIterator() -> AnyIterator<Book> {
        var iterator = books.makeIterator()

        return AnyIterator {
            while let next = iterator.next() {
                return next
            }
            return nil
        }
    }
}
 */

//: [Next](@next)

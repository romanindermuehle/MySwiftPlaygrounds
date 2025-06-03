//: [Previous](@previous)

import Foundation

// Ask: Bridge Pattern == Dependency injection?

protocol Application {
    var database: Database { get set }
    func run()
}

protocol Database {
    func connect()
}

class MongoDB: Database {
    func connect() {
        print("Successfully connected to MongoDB server.")
    }
}

class Redis: Database {
    func connect() {
        print("Successfully connected to Redis server.")
    }
}

class VaporApp: Application {
    var database: any Database
    
    init(database: Database) {
        self.database = database
    }
    
    func run() {
        database.connect()
        print("VaporApp starting on http://127.0.0.1:8080")
    }
}

class SpringBootApp: Application {
    var database: any Database
    
    init(database: Database) {
        self.database = database
    }
    
    func run() {
        database.connect()
        print("SpringBootApp starting on http://127.0.0.1:8080")
    }

}

let vaporApp = VaporApp(database: MongoDB())
let springBootApp = SpringBootApp(database: Redis())

vaporApp.run()
springBootApp.run()

//: [Next](@next)


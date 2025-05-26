//: [Previous](@previous)

import Foundation

class HTTPClient {
    static var shared = HTTPClient()
    
    var usage: Int = 0 {
        willSet {
            print("Old Value: \(usage)")
        }
        didSet {
            print("New Value: \(usage)")
        }
    }
    
    func sendRequest(url: String) -> String {
        "Data from API"
    }
    
    
    var url: String
    
    private init() {
        url = "http://firstValue.com"
    }
}

class Bla {
    init () {
        
    }
    
    func getBla() {
        HTTPClient.shared.url = "http://bla.bla.com"
        HTTPClient.shared.usage += 1
    }
}

class Blu {
    init () {
        
    }
    
    func getBlu() {
        HTTPClient.shared.url = "http://blu.blu.com"
        HTTPClient.shared.usage += 1
    }
}

let myBla = Bla()
let mzBlu = Blu()

print(HTTPClient.shared.url)
myBla.getBla()
print(HTTPClient.shared.url)
mzBlu.getBlu()
print(HTTPClient.shared.url)


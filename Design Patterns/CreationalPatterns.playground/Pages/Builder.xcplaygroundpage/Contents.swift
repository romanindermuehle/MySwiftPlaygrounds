//: [Previous](@previous)

/*:
 Links:
 
 [Builder pattern article](https://theswiftdev.com/swift-builder-design-pattern/)
 
 [Supabase example](https://github.com/supabase/supabase-swift/tree/main/Sources/PostgREST)
 */

import Foundation
import UIKit

// MARK: URLBuilder

class URLBuilder {
    
    private var components: URLComponents
    
    init() {
        self.components = URLComponents()
    }
    
    func set(scheme: String) -> URLBuilder {
        self.components.scheme = scheme
        return self
    }
    
    func set(host: String) -> URLBuilder {
        self.components.host = host
        return self
    }
    
    func set(port: Int) -> URLBuilder {
        self.components.port = port
        return self
    }
    
    func set(path: String) -> URLBuilder {
        var path = path
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        
        self.components.path = path
        return self
    }
    
    func addQueryItem(name: String, value: String) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        
        self.components.queryItems?.append(URLQueryItem(name: name, value: value))
        return self
    }
    
    func build() -> URL? {
        return self.components.url
    }
}

let url = URLBuilder()
    .set(scheme: "https")
    .set(host: "localhost")
    .set(port: 8080)
    .set(path: "api/v1")
    .addQueryItem(name: "sort", value: "name")
    .addQueryItem(name: "order", value: "asc")
    .build()


// MARK: Swifty approach

extension UILabel {

    static func build(block: ((UILabel) -> Void)) -> UILabel {
        let label = UILabel(frame: .zero)
        block(label)
        return label
    }
}

let label = UILabel.build { label in
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hello wold!"
    label.font = UIFont.systemFont(ofSize: 12)
}


//: [Next](@next)

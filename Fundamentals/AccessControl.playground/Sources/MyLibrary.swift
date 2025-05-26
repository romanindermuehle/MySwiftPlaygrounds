//
//  MyLibrary.swift
//
//
//  Created by Roman Indermühle on 19.05.2025.
//

import Foundation

// Info: The compiler treats this file as if it were a different module.

// MARK: Internal level

// Remember: By default, everything is set to the 'internal' protection level. Therefore, it will not be accessible from outside this module.
class Device {
    var type: DeviceType
    var name: String
    
    init(type: DeviceType, name: String) {
        self.type = type
        self.name = name
    }
}

enum DeviceType {
    case smartphone
    case tablet
    case pc
    case camera
}

// MARK: Public level

// Remember: When you set a class as 'public'. The properties and initializer stay 'internal'. Otherwise, you have to set it explicitly 'public' to access it.
public class Account {
    public var username: String
    
    public init(username: String) {
        self.username = username
    }
}

// MARK: Open level

// Remember: The 'open' protection level enables us to inherit from this class outside of this module. This is not possible with the 'public' protection level.
open class Animal {
    public var name: String
    public var age: Int
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Remember: This function can only be overridden when marked as 'open'.
    open func getName() -> String {
        name
    }
}

import Foundation

// MARK: Without using weak
class  Employee {
    
  var name: String
  var salary: Int
  var colleague: Employee?

  // define initializer
  init(name: String, salary: Int) {
    self.name = name
    self.salary = salary
  }

  // define deinitializer
  deinit {
    print("Memory Deallocated")
  }
}

// create instances of Employee
var sabby: Employee? = Employee(name: "Sabby", salary: 50000)
var cathy: Employee? = Employee(name: "Cathy", salary: 45000)

// increased reference count of cathy and sabby to 2
sabby?.colleague = cathy
cathy?.colleague = sabby

// deallocate objects
sabby = nil
cathy = nil


// MARK: With using weak
class  Employee2 {
    
  var name: String
  var salary: Int

  // weak property declaration. This ensures that the reference count will never exceed 1.
  weak var colleague: Employee?

  // define initializer
  init(name: String, salary: Int) {
    self.name = name
    self.salary = salary
  }

  // define deinitializer
  deinit {
    print("Memory Deallocated")
  }
}

// create instances of Employee
var sabby2: Employee2? = Employee2(name: "Sabby", salary: 50000)
var cathy2: Employee2? = Employee2(name: "Cathy", salary: 45000)

// colleague property of sabby instance refers to cathy instance
sabby2?.colleague = cathy

// colleague property of cathy instance refers to sabby instance
cathy2?.colleague = sabby

// deallocate objects
sabby2 = nil
cathy2 = nil

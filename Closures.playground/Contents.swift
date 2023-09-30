import Cocoa

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    print(name)
    return name.hasPrefix("T")
})

print(onlyT)


//let onlyT = team.filter({ $0.hasPrefix("T") })
//print(onlyT.count)

//: [Previous](@previous)

import Foundation

protocol FileSystemComponent {
    var name: String { get }
    func printStructure(indent: String)
}

class File: FileSystemComponent {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printStructure(indent: String = "") {
        print("\(indent)- \(name)")  // Datei anzeigen
    }
}

class Directory: FileSystemComponent {
    let name: String
    private var children: [FileSystemComponent] = []
    
    init(name: String) {
        self.name = name
    }
    
    func add(node: FileSystemComponent) {
        children.append(node)
    }
    
    func printStructure(indent: String = "") {
        print("\(indent)+ \(name)")   // Verzeichnis anzeigen
        for child in children {
            child.printStructure(indent: indent + "  ")  // Rekursiv durchgehen
        }
    }
}

// Beispiel-Baum aufbauen:
let root = Directory(name: "/")
let imageDir = Directory(name: "Bilder")
let screenshotsDir = Directory(name: "screenshots")
let musicDir = Directory(name: "Musik")

let fileA = File(name: "a.txt")
let fileVacation = File(name: "urlaub.jpg")
let fileScreenshot = File(name: "bild1.png")
let fileSong = File(name: "song.mp3")

// Struktur zusammenbauen
root.add(node: fileA)
root.add(node: imageDir)
root.add(node: musicDir)
imageDir.add(node: fileVacation)
imageDir.add(node: screenshotsDir)
screenshotsDir.add(node: fileScreenshot)
musicDir.add(node: fileSong)

// Struktur ausgeben
root.printStructure()


//: [Next](@next)

//: [Previous](@previous)

import Foundation

// Subject
protocol Image {
    func display()
}

// Real Subject (concrete class)
class RealImage: Image {
    private var filename: String
    
    init(filename: String) {
        self.filename = filename
        loadFromDisk()
        
    }
    
    private func loadFromDisk() {
        print("Loading image: \(filname)")
    }
    
    func display() {
        print("Displaying image: \(filename)")
    }
}

// Proxy (concrete class)
class ImageProxy: Image {
    private var realImage: RealImage?
    private var filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    func display() {
        if realImage == nil {
            realImage = RealImage(filename: filename)
        }
        
        realImage.display()
    }
}

// Client
let image: Image = ImageProxy(filename: "sample.jpg")
// The image is not loaded until the display method is called
image.display()

//: [Next](@next)

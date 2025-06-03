import PlaygroundSupport
import UIKit
import SwiftUI

/*:
 Links:
 
 [Adapter pattern article](https://theswiftdev.com/swift-adapter-design-pattern/)
 
 */

// Adaptee: A UIKit View
class UIKitView: UIView {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        label.text = "Hello from UIKit!"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}


// Adapter: UIViewRepresentable to adapt UIKitView for SwiftUI
struct UIKitViewAdapter: UIViewRepresentable {
    func makeUIView(context: Context) -> UIKitView {
        return UIKitView()
    }

    func updateUIView(_ uiView: UIKitView, context: Context) {
        // Update the view if needed
    }
}

// Usage in SwiftUI
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello from SwiftUI!")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.orange)
                .padding()

            UIKitViewAdapter()
                .frame(height: 200)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())


#Preview {
    ContentView()
}

//: [Next](@next)

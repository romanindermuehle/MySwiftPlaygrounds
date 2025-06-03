//: [Previous](@previous)

import Foundation
import CoreAudioKit
import SwiftUI
import PlaygroundSupport

// MARK: Client
struct MySettingsView: View {
    @State var isOn: Bool = false
    
    var body: some View {
        Toggle("Wi-Fi", isOn: $isOn)
            .onChange(of: isOn) {
                isOn = toggleSettings()
            }
    }
}

// MARK: Facade/Subsystem
// Whole class = Facade
func toggleSettings() -> Bool {
    // change underlying settings value
    let settingsKey = "wifi"

    // UserDefault = Subsystem
    let originalValue = UserDefaults.standard.bool(forKey: settingsKey)
    let newValue = !originalValue

    UserDefaults.standard.set(newValue, forKey: settingsKey)
    UserDefaults.standard.synchronize()

    // positive feedback sound
    AudioServicesPlaySystemSound(1054)

    // update UI
    return newValue
}

PlaygroundPage.current.setLiveView(MySettingsView())

//: [Next](@next)

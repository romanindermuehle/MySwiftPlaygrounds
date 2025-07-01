import Foundation

protocol DoorCloseCommand {
    func close()
}
protocol DoorOpenCommand {
    func open()
}

struct MainDoor: DoorCloseCommand, DoorOpenCommand {

    func close() {
        print("MainDoor -> " + #function)
    }

    func open() {
        print("MainDoor -> " + #function)
    }
}


struct HallDoor: DoorCloseCommand, DoorOpenCommand {

    func close() {
        print("HallDoor -> " + #function)
    }

    func open() {
        print("HallDoor -> " + #function)
    }
}

struct GarageDoor: DoorCloseCommand, DoorOpenCommand {

    func close() {
        print("GarageDoor -> " + #function)
    }

    func open() {
        print("GarageDoor -> " + #function)
    }
}

struct SecurityRemoteControl {

    // MARK: - Properties

    var door: DoorCloseCommand & DoorOpenCommand

    // MARK: - Initializers

    init(_ door: DoorCloseCommand & DoorOpenCommand) {
        self.door = door
    }

    // MARK: - Methods

    func openDoor() {
        door.open()
    }

    func closeDoor() {
        door.close()
    }
}

let mainDoor = MainDoor()
let hallDoor = HallDoor()
let garageDoor = GarageDoor()

var remoteControl = SecurityRemoteControl(mainDoor)
remoteControl.openDoor()
remoteControl.closeDoor()

remoteControl.door = hallDoor
remoteControl.openDoor()

remoteControl.door = garageDoor
remoteControl.openDoor()


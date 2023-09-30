import Foundation


//enum Availability {
//    case available
//    case busy
//    case OutOfOffice
//    case DoNotDisturb
//}
//
//func getAvailability(status: Availability) -> String? {
//    switch status {
//    case .available:
//        return "available"
//    case .busy:
//        return "busy"
//    case .OutOfOffice:
//        return "OutOfOffice"
//    case .DoNotDisturb:
//        return "DoNotDisturb"
//    }
//}
//
//getAvailability(status: Availability.DoNotDisturb)
//
//let status = getAvailability(status: Availability.busy)
//if let input = readLine() {
//    if input == "busy" {
//        Availability.busy
//    }
//}
//print(status ?? "")



enum Authentication {
    case passcode
    case touchId
    case faceId
    case opticId
    case failed
}

let authentication = Authentication.touchId

switch authentication {
case .passcode:
    print("Your passcode is correct")
case.touchId:
    print("TouchID authentication sucessful")
case.faceId:
    print("FaceID authentication sucessful")
case .opticId:
    print("OpticID authentication sucessful")
case .failed:
    print("Authentication failed")
}



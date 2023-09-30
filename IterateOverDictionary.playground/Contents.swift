import Foundation

var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

//print(responseMessages[200])

func modifyValue(valueString: String) -> String {
    var Input = valueString


    // Replace String
    Input = Input.replacingOccurrences(of: "File not found", with: "Sorry I lost your file")

    // Replace String
    Input = Input.replacingOccurrences(of: "Internal server error", with: "Housten we have a problem")

    print(Input)
    return Input
}

for (_, value) in responseMessages {
    //print("\(key) is known as the \(value)")
    modifyValue(valueString: value)
}



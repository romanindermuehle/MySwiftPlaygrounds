import Foundation

struct Result: Codable {
    let channels: [String: ChannelValue]
}

struct ChannelValue: Codable {
    let title: String
    let description: String
    let logo: String
}

func modifyValue(valueString: String) -> String {
    var Input = valueString


    // Replace String
    Input = Input.replacingOccurrences(of: "File not found", with: "Sorry I lost your file")

    // Replace String
    Input = Input.replacingOccurrences(of: "Internal server error", with: "Housten we have a problem")

    print(Input)
    return Input
}

let url = URL(string: "https://www.swisscom.ch/portal-services/portal-integration/ws/channellist/channel-list/de")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    let decoder = JSONDecoder()
    if let data = data{
        do {
            let posts = try decoder.decode(Result.self, from: data)
            //print(posts)
            
            for (_, value) in responseMessages {
                //print("\(key) is known as the \(value)")
                modifyValue(valueString: value)
            }
            
        } catch {
            print(error)
        }
    }
}
task.resume()

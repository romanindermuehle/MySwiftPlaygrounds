import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: URLSession

func fetchData(from urlString: String) async throws -> String {
    guard let url = URL(string: urlString) else {
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    return String(data: data, encoding: .utf8) ?? "No data"
}

// MARK: Single execution of the fetchData function

Task {
    do {
        let data = try await fetchData(from: "https://www.example.com")
        print("Fetched data: \(data)")
    } catch {
        print("Error fetching data: \(error)")
    }
}

// MARK: Parallel execution of the fetchData function

func fetchMultipleData() async {
    let urls = [
        "https://www.example.com",
        "https://www.apple.com"
    ]
    
    async let firstData = fetchData(from: urls[0])
    async let secondData = fetchData(from: urls[1])
    
    do {
        let (data1, data2) = try await (firstData, secondData)
        print("First data: \(data1)")
        print("Second data: \(data2)")
    } catch {
        print("Error fetching multiple data: \(error)")
    }
}

Task {
    await fetchMultipleData()
}

// MARK: Data racing example

actor Cat {
    var name: String
    var age: Int
    var owner: String
    
    init(name: String, age: Int, owner: String) {
        self.name = name
        self.age = age
        self.owner = owner
    }
    
    func replaceName(with name: String) async {
        print("Start replacing name to \(name)")
        try? await Task.sleep(for: .seconds(1))
        self.name = name
        print("Finished replacing name to \(name)")
    }
    
    func incrementAge(from: Int) {
        age += 1
        print("Actual age is \(age), changed from Thread: \(from)")
    }
    
    func getAge() -> Int {
        return age
    }
}

let cat = Cat(name: "Leo", age: 0, owner: "Luca")

for i in 0 ... 20 {
    print("Task\(i): \(await cat.getAge())")
    await cat.incrementAge(from: i)
    print("Task\(i): \(await cat.getAge())")
}

PlaygroundPage.current.finishExecution()

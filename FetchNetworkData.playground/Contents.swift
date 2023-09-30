import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

var postArray: [Post] = []

//let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    /*if let data = data, let string = String(data: data, encoding: .utf8) {
     print(string)
     }*/

    let decoder = JSONDecoder()
    if let data = data{
        
        do {
            let posts = try decoder.decode([Post].self, from: data)
            //print("found \(posts.count) posts")
            postArray = posts.map { $0.self }
            print(postArray)
            
        } catch {
            print(error)
        }
        
        
    }
}
task.resume()

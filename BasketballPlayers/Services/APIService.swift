import Foundation

class APIService {
    private let apiKey = "288938d2-110d-4860-ad60-a61abe2200fb"
    func fetchPlayers(completion: @escaping ([Player]?) -> Void) {
        guard let url = URL(string: "https://api.balldontlie.io/v1/players") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(PlayerResponse.self, from: data)
                    completion(response.data)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}

struct PlayerResponse: Decodable {
    let data: [Player]
}

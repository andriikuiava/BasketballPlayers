import Foundation

struct Player: Identifiable, Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let position: String?
    let height: String?
    let weight: String?

    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position
        case height
        case weight
    }
}


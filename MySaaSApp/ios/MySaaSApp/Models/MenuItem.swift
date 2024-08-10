import Foundation

struct MenuItem: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let price: Double
    let categoryId: String
}

struct Category: Identifiable, Codable {
    let id: String
    let name: String
}

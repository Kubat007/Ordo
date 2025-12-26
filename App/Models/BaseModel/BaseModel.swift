import Foundation

struct APIError: Decodable {
    let message: String
    let code: Int?
}

struct BaseModel<T: Decodable>: Decodable {
    let success: Bool?
    let data: T?
    let message: String?
}

struct BaseArrayItemModel<T: Decodable>: Decodable {
    let count: Int?
    let success: Bool?
    let items: [T]?
    let message: String?
}

struct BaseArrayModel<T: Decodable>: Decodable {
    let count: Int?
    let success: Bool?
    let results: [T]?
    let message: String?
}

struct BaseIntModel: Decodable {
    let success: Bool?
    let data: Int?
    let message: String?
}

struct BaseStringModel: Decodable {
    let success: Bool?
    let data: String?
    let message: String?
}

struct BaseBoolModel: Decodable {
    let success: Bool?
    let data: Bool?
    let message: String?
}

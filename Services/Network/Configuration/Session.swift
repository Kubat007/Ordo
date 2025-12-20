import Foundation

protocol Session {
    var isAuthorized: Bool { get }
    func getToken() -> String
    func removeToken()
    func removeAll()
//    func getService(id: Int) -> MainModels.Response.Service?
//    func getAllServices() -> [MainModels.Response.Service]?
}

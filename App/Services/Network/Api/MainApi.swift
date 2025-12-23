import Foundation
import RealHTTP
import UIKit

let deviceID = UIDevice.current.identifierForVendor?.uuidString
let OS = UIDevice.current.systemName
let systemVersion = UIDevice.current.systemVersion
let deviceName = UIDevice.current.model
let deviceBrand = "Apple"
let deviceModel = UIDevice().type

enum MainApi {
    struct GetBanner: Codable, APIResourceConvertible {
        typealias Result = [MainModels.Response.Banner]
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/banner/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct GetProducts: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<MainModels.Response.Products>
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/product/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }

    struct GetCategory: Codable, APIResourceConvertible {
        typealias Result = [MainModels.Response.Category]
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/product/category/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct SendFavorite: Codable, APIResourceConvertible {
        typealias Result = MainModels.Response.SendFavorite
        let productId: Int
        
        private enum CodingKeys: String, CodingKey {
                case productId
            }
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/user_favorites/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(self)
            }
        }
    }
}

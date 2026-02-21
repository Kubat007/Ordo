import Foundation
import RealHTTP
import UIKit

// MARK: - Device Info (Optimized for fast startup)
let deviceID = UIDevice.current.identifierForVendor?.uuidString
let OS = UIDevice.current.systemName
let systemVersion = UIDevice.current.systemVersion
let deviceName = UIDevice.current.model
let deviceBrand = "Apple"

let deviceModel: String = {
    #if targetEnvironment(simulator)
    return "Simulator"
    #else
    // On real devices, get actual model (this is fast on device, slow on simulator)
    return UIDevice().type.rawValue
    #endif
}()

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
        let product: Int
        
        private enum CodingKeys: String, CodingKey {
                case product
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
    
    struct GetFavorites: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<MainModels.Response.GetFavorites>
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/my_profile_favorites/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct DeleteFavorite: Codable, APIResourceConvertible {
        typealias Result = EmptyResponse
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/user_favorites/\(id)/"
                $0.method = .delete
                $0.maxRetries = 1
            }
        }
    }
    
    struct AdddCart: Codable, APIResourceConvertible {
        typealias Result = BaseIntModel
        let model: MainModels.Request.AddCArt
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/cart/item/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(model)
            }
        }
    }
    
    struct GetSimilarProduct: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<MainModels.Response.Products>
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/similar_products/\(id)/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct GetSubCategoryProducts: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<MainModels.Response.Products>
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/product/"
                $0.method = .get
                $0.maxRetries = 1
                $0.add(parameters: ["subcategory": id])
            }
        }
    }
    
    struct ChangeQuantityCart: Codable, APIResourceConvertible {
        typealias Result = BaseIntModel
        let model: MainModels.Request.ChangeQuantityCArt
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/cart/item/\(id)/"
                $0.method = .patch
                $0.maxRetries = 1
                $0.body = .json(model)
            }
        }
    }
}

struct EmptyResponse: Codable {}

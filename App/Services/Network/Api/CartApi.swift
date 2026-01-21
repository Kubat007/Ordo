//
//  CartApi.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

import RealHTTP

enum CartApi {
    struct GetCart: Codable, APIResourceConvertible {
        typealias Result = CartModel.Response.GetCartModel
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/cart/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct DeleteCart: Codable, APIResourceConvertible {
        typealias Result = CartModel.Response.GetCartModel
        let id: Int?
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/cart/item/\(id ?? 0)/"
                $0.method = .delete
                $0.maxRetries = 1
            }
        }
    }
    
    struct Order: Codable, APIResourceConvertible {
        typealias Result = CartModel.Response.Order
        let model: CartModel.Request.OrderRequest
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/order/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(model)
            }
        }
    }
    
    struct GetHistory: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<CartModel.Response.Order>
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/order/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct GetHistoryDetail: Codable, APIResourceConvertible {
        typealias Result = CartModel.Response.Order
        let id: Int?
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/order/\(id ?? 0)/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
}

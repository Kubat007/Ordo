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
}

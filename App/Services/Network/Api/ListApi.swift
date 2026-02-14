//
//  ListApi.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

import RealHTTP

enum ListApi {
    struct GetList: Codable, APIResourceConvertible {
        typealias Result = ListModel.Response.GetList?
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/search-list/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct AddProductList: Codable, APIResourceConvertible {
        typealias Result = ListModel.Response.GetAddProductList?
        let model: ListModel.Request.AddProductList?
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/search-list/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(model)
            }
        }
    }
    
    struct DeleteProductList: Codable, APIResourceConvertible {
        typealias Result = EmptyResponse
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/search-list/\(id)/"
                $0.method = .delete
                $0.maxRetries = 1
            }
        }
    }
    
    struct GetChangeProductList: Codable, APIResourceConvertible {
        typealias Result = ListModel.Response.GetChangedProductList?
        let model: ListModel.Request.SendChangeProductList
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/search-list/\(id)/"
                $0.method = .put
                $0.maxRetries = 1
                $0.body = .json(model)
            }
        }
    }
    
    struct GetCollectProductList: Codable, APIResourceConvertible {
        typealias Result = ListModel.Response.GetCollectProductList?
        let model: ListModel.Request.SendCollectProductList
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/search-list/search/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(model)
            }
        }
    }
    
    struct GetDetailProductList: Codable, APIResourceConvertible {
        typealias Result = ListModel.Response.GetDetailProductListModel?
        let id: Int
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/search-list/\(id)/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
}

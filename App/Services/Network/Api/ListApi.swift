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
}

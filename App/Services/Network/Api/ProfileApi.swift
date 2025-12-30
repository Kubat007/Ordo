//
//  ProfileApi.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

import RealHTTP

enum ProfileApi {
    struct GetNews: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<ProfileModel.Response.NewsModeL>
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/news/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
}

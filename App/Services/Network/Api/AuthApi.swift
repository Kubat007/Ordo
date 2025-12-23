//
//  AuthApi.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import RealHTTP

enum AuthApi {
    struct SendPhoneNumber: Codable, APIResourceConvertible {
        typealias Result = AuthModel.Response.PhoneNumberModel
        let phone: String
        
        private enum CodingKeys: String, CodingKey {
                case phone
            }
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/ru/check_phone/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(self)
            }
        }
    }
}

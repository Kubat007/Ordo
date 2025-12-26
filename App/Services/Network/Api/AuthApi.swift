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
    
    struct Login: Codable, APIResourceConvertible {
        typealias Result = AuthModel.Response.PhoneNumberModel
        let phone: String
        let code: String
        
        private enum CodingKeys: String, CodingKey {
            case phone
            case code
        }
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/check_code/"
                $0.method = .post
                $0.maxRetries = 1
                $0.body = .json(self)
            }
        }
    }
}

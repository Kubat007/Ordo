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
    
    struct GetNewsDetail: Codable, APIResourceConvertible {
        typealias Result = ProfileModel.Response.NewsDetailModel
        let newsId: Int?
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/news/\(newsId ?? 0)/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct GetFAQ: Codable, APIResourceConvertible {
        typealias Result = BaseArrayModel<ProfileModel.Response.FAQModel>
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/faq/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
    
    struct GetFAQDetail: Codable, APIResourceConvertible {
        typealias Result = ProfileModel.Response.FAQModel
        let faqId: Int?
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "/faq/\(faqId ?? 0)/"
                $0.method = .get
                $0.maxRetries = 1
            }
        }
    }
}

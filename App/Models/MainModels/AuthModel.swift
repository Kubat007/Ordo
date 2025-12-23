//
//  AuthModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

enum AuthModel {
    enum Response {
        struct PhoneNumberModel: Codable {
            let success: Bool?
            let message: String?
        }
    }
    
    enum Request {
        struct SimpleModel: Codable {
            let id: Int
        }
    }
}

//
//  ListModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

enum ListModel {
    enum Response {
        struct GetList: Codable {
            let count: Int?
            let next: Bool?
            let previous: Bool?
            let results: [GetListResults]?
        }
        
        struct GetListResults: Codable {
            let id: Int?
            let name: String?
            let items: [GetListItems]?
            let created_at: String?
            let updated_at: String?
        }
        
        struct GetListItems: Codable {
            let term: String?
        }
    }
    
    enum Request {
        struct Model: Codable {
            let id: Int
        }
    }
}

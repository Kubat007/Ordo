//
//  ProfileModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

import UIKit

enum ProfileModel {
    enum Response {
        struct NewsModeL: Codable {
            let id: Int?
            let title: String?
            let date: String?
        }
        
        struct NewsDetailModel: Codable {
            let id: Int?
            let image: String?
            let date: String?
            let title: String?
            let text: String?
        }
        
        struct FAQModel: Codable {
            let id: Int?
            let question: String?
            let response: String?
        }
    }
}

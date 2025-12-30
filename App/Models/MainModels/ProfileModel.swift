//
//  ProfileModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

enum ProfileModel {
    enum Response {
        struct NewsModeL: Codable {
            let id: Int?
            let title: String?
            let date: String?
        }
    }
}

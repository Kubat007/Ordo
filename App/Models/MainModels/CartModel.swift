//
//  CartModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

enum CartModel {
    enum Response {
        struct GetCartModel: Codable {
            let id: Int?
            let is_active: Bool?
            let created_at: String?
            let updated_at: String?
            let items: [Items]?
            let total_items: Int?
            let total_price: Int?
        }
        
        struct Items: Codable {
            let id: Int?
            let product_id: Int?
            let product_title: String?
            let product_price: Int?
            let product_image: String?
            let quantity: Int?
            let available_stock: Int?
            let unit_price: Int?
            let line_total: Int?
        }
    }
}

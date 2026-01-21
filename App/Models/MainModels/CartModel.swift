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
            var items: [Items]?
            var total_items: Int?
            var total_price: Int?
        }
        
        struct Items: Codable {
            let id: Int?
            let product_id: Int?
            let product_title: String?
            let product_price: Int?
            let product_image: String?
            var quantity: Int?
            let available_stock: Int?
            let unit_price: Int?
            let line_total: Int?
        }
        
        struct Order: Codable {
            let id: Int?
            let status: String?
            let address: String?
            let delivery_date: String?
            let payment_method: String?
            let delivery_method: String?
            var loader_service: Bool?
            let delivery_cost: Double?
            let loader_cost: Double?
            let products_total: Int?
            let total_amount: Int?
            let created_at: String?
            let items: [OrderItems]?
        }
        
        struct OrderItems: Codable {
            let id: Int?
            let product: Int?
            let product_title: String?
            let product_image: String?
            var quantity: Int?
            let unit_price: Int?
            let line_total: Int?
        }
    }
    
    enum Request {
        struct OrderRequest: Codable {
            let address: String?
            let delivery_cost: Int?
            let delivery_date: String?
            let delivery_method: String?
            let loader_cost: Int?
            let loader_service: Bool?
            let payment_method: String?
        }
    }
}

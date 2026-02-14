//
//  ListModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

enum ListModel {
    enum Response {
        struct GetList: Codable {
            var count: Int?
            let next: Bool?
            let previous: Bool?
            var results: [GetListResults]?
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
        
        struct GetAddProductList: Codable {
            let id: Int?
            let name: String?
            let items: [AddProductListItems]?
            let created_at: String?
            let updated_at: String?
        }
        
        struct AddProductListItems: Codable {
            
        }
        
        struct GetChangedProductList: Codable {
            let id: Int?
            let name: String?
            let items: [ChangedProductListItems]?
            let created_at: String?
            let updated_at: String?
        }
        
        struct ChangedProductListItems: Codable {
            let id: Int?
            let term: String?
        }
        
        struct GetCollectProductList: Codable {
            let results: [CollectSection]?
        }

        struct CollectSection: Codable {
            let title: String?
            let products: [GetCollectProductItems]?
        }
        
        struct GetCollectProductItems: Codable {
            let id: Int?
            let images_gallery : [Images_gallery]
            let date: String?
            let view_count: Int?
            let type_name: String?
            let type: Int?
            let price: Int?
            let currency: Int?
            let currency_name: String?
            let currency_value: String?
            let title: String?
            let text: String?
            let is_favorite: Bool?
            let favorite_id: Int?
            let user: Int?
            let user_image: String?
            let user_name: String?
            let count_of_products: Int?
            let user_phone: String?
            let schedule: String?
            let address: String?
            let latitude: String?
            let longitude: String?
            let work_experience: String?
            let work_time_from: String?
            let work_time_to: String?
            let is_work_now: Bool?
            let telegram_account: String?
            let stock: Int?
            let subcategory: Int?
        }
        
        struct Images_gallery: Codable {
            let id: Int?
            let image: String?
        }
        
        struct GetDetailProductListModel: Codable {
            let id: Int?
            let name: String?
            var items: [DetailProductListItems]?
        }
        
        struct DetailProductListItems: Codable {
            let id: Int?
            let term: String?
        }
    }
    
    enum Request {
        struct AddProductList: Codable {
            let name: String
        }
        
        struct SendCollectProductList: Codable {
            let list_id: String
        }
        
        struct SendChangeProductList: Codable {
            let name: String
            let items: [SendChangeItemsProducts]?
        }
        
        struct SendChangeItemsProducts: Codable {
            let term: String
        }
    }
}

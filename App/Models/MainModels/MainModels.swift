// Product.swift
enum MainModels {
    enum Response {
        struct Banner: Codable {
            let id: Int
            let image: String
            let slider_image: String
            let title: String
            let banner_type: String
            let description: String
        }
        
        struct Products: Codable {
            let id: Int
            let status: String
            let category: Int
            let type: Int
            let title: String
            let text: String
            let price: Double
            let currency: Int
            let currency_name: String
            let currency_value: String
            let images_gallery : [Images_gallery]
        }
        
        struct Images_gallery: Codable {
            let id: Int
            let image: String
        }
        
        struct Category: Codable {
            let id: Int?
            let name: String?
            let icon: String?
            let count_of_category_product: Int?
            
        }
        
        struct SendFavorite: Codable {
            let favorite_id: Int?
            let user: Int?
            let product: Int?
        }
        
        struct GetFavorites: Codable {
            let id: Int?
            let product_id: Int?
            let product_title: String?
            let product_price: Int?
            let product_currency: String?
            let currency_value: String?
            let product_images: String?
            let city: String?
        }
    }
    
    enum Request {
        struct Favorite: Codable {
            var name: String
            var accountGuid: String
            var serviceId: Int
            var requisite: String
            var amount: Double
        }
        
        struct EditFavorite: Codable {
            var id: Int
            var recTime: String?
            var isDeleted: Bool?
            var accountGuid: String
            var name: String?
            var serviceId: Int
            var requisite: String?
            var amount: Double?
            var image: String?
        }
        
        struct AddCArt: Codable {
            var product_id: Int?
            var quantity: Int?
        }
    }
}

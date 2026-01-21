//
//  MapModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 19/1/26.
//

enum MapModels {
    enum Response {
        struct Address {
            let street: String
            let houseNumber: String
            let city: String
            let fullAddress: String
        }
        
        struct Location {
            let latitude: Double
            let longitude: Double
            let address: String
        }
    }
    
    enum Request {
        struct GetAddress {
            let latitude: Double
            let longitude: Double
        }
        
        struct SetLocation {
            let latitude: Double
            let longitude: Double
            let address: String
        }
    }
}

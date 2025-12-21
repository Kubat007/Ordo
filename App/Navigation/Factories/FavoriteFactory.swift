//
//  FavoriteFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol FavoriteFactory {
    func makeMainVC() -> FavoriteVC
}

final class FavoriteFactoryImpl: FavoriteFactory {
    var services: Services
    
    func makeMainVC() -> FavoriteVC {
        return FavoriteBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

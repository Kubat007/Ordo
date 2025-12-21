//
//  ProfileFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol ProfileFactory {
    func makeMainVC() -> ProfileVC
}

final class ProfileFactoryImpl: ProfileFactory {
    var services: Services
    
    func makeMainVC() -> ProfileVC {
        return ProfileBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

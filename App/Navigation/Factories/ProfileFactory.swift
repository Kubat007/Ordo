//
//  ProfileFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol ProfileFactory {
    func makeProfileVC() -> ProfileVC
    func makeAuthVC() -> AuthVC
}

final class ProfileFactoryImpl: ProfileFactory {
    var services: Services
    
    func makeProfileVC() -> ProfileVC {
        return ProfileBuilder(services: services).build()
    }
    
    func makeAuthVC() -> AuthVC {
        return AuthBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

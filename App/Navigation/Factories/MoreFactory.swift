//
//  MoreFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol MoreFactory {
    func makeMainVC() -> MoreVC
}

final class MoreFactoryImpl: MoreFactory {
    var services: Services
    
    func makeMainVC() -> MoreVC {
        return MoreBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

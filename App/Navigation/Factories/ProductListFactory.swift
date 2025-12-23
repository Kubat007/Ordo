//
//  ProductListFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol ProductListFactory {
    func makeMainVC() -> ProductListVC
    func makeMyList() -> MyListVC
}

final class ProductListFactoryImpl: ProductListFactory {
    var services: Services
    
    func makeMainVC() -> ProductListVC {
        return ProductListBuilder(services: services).build()
    }
    
    func makeMyList() -> MyListVC {
        return MyListBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

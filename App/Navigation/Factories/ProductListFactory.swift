//
//  ProductListFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol ProductListFactory {
    func makeMainVC() -> ProductListVC
    func makeMyList() -> ProductListItemsVC
    func makeProductListItems() -> ProductListItemsVC
    func makeCollectProductVC() -> CollectProductListVC
}

final class ProductListFactoryImpl: ProductListFactory {
    var services: Services
    
    func makeMainVC() -> ProductListVC {
        return ProductListBuilder(services: services).build()
    }
    
    func makeMyList() -> ProductListItemsVC {
        return ProductListItemsBuilder(services: services).build()
    }
    
    func makeProductListItems() -> ProductListItemsVC {
        return ProductListItemsBuilder(services: services).build()
    }
    
    func makeCollectProductVC() -> CollectProductListVC {
        return CollectProductListBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

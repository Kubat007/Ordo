protocol MainFactory {
    func makeMainVC() -> MainVC
    func makeSubCategoryVC() -> SubCategoryVC
    func makeBannerVC() -> BannerVC
    func makeMainDetailVC() -> MainDetailVC
}

final class MainFactoryImpl: MainFactory {
    
    var services: Services
    
    func makeMainVC() -> MainVC {
        return MainBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
    
    func makeSubCategoryVC() -> SubCategoryVC {
        return SubCategoryBuilder(services: services).build()
    }
    
    func makeBannerVC() -> BannerVC {
        return BannerBuilder(services: services).build()
    }
    
    func makeMainDetailVC() -> MainDetailVC {
        return MainDetailBuilder(services: services).build()
    }
}

protocol MainFactory {
    func makeMainVC() -> MainVC
}

final class MainFactoryImpl: MainFactory {
    var services: ApiServices
    
    func makeMainVC() -> MainVC {
        return MainBuilder(services: services).build()
    }
    
    init(services: ApiServices) {
        self.services = services
    }
}

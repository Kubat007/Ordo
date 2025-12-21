protocol MainFactory {
    func makeMainVC() -> MainVC
}

final class MainFactoryImpl: MainFactory {
    var services: Services
    
    func makeMainVC() -> MainVC {
        return MainBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

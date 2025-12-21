//
//  MainCoordinator.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/11/25.
//

final class MainCoordinator: BaseCoordinator, MainCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: MainFactory
    private let services: Services
    
    init(router: Router, factory: MainFactory, services: Services) {
        self.router = router
        self.factory = factory
        self.services = services
    }
    
    override func start() {
        showMain()
    }
    
    private func showMain() {
        let mainVC = MainBuilder(services: services).build()
        router.setRootModule(mainVC, hideBar: true)
    }
}

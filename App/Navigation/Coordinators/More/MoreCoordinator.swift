//
//  MoreCoordinator.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class MoreCoordinator: BaseCoordinator, MoreCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: MoreFactory
    private let services: Services
    
    init(router: Router, factory: MoreFactory, services: Services) {
        self.router = router
        self.factory = factory
        self.services = services
    }
    
    override func start() {
        showMain()
    }
    
    private func showMain() {
        let vc = MoreBuilder(services: services).build()
        router.setRootModule(vc, hideBar: true)
    }
}

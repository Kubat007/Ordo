//
//  FavoriteCoordinator.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class FavoriteCoordinator: BaseCoordinator, FavoriteCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: FavoriteFactory
    private let services: Services
    
    init(router: Router, factory: FavoriteFactory, services: Services) {
        self.router = router
        self.factory = factory
        self.services = services
    }
    
    override func start() {
        showMain()
    }
    
    private func showMain() {
        let vc = FavoriteBuilder(services: services).build()
        router.setRootModule(vc, hideBar: true)
    }
}

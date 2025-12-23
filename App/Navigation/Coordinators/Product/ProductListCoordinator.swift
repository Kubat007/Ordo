//
//  ProductListCoordinator.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class ProductListCoordinator: BaseCoordinator, ProductListCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: ProductListFactory
    private let services: Services
    
    init(router: Router, factory: ProductListFactory, services: Services) {
        self.router = router
        self.factory = factory
        self.services = services
    }
    
    override func start() {
        showMain()
    }
    
    private func showMain() {
        let vc = ProductListBuilder(services: services).build()
        vc.hidesBottomBarWhenPushed = true
        vc.viewModel.onMyListAction = showMyListVC
        router.push(vc)
    }
    
    func showMyListVC() {
        let vc = factory.makeMyList()
        vc.viewModel.onBackAction = router.popModule
        router.push(vc, hideBottomBar: true)
    }
}

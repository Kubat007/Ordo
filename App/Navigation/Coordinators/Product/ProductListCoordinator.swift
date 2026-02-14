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
        vc.viewModel.onProductListItemsAction = showProductListItemsVC
        router.push(vc)
    }
    
    func showMyListVC(id: Int, fromCreate: Bool) {
        let vc = factory.makeMyList()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.id = id
        vc.fromCreate = fromCreate
        vc.viewModel.onCollectProductAction = showCollectProductListVC
        router.push(vc, hideBottomBar: true)
    }
    
    func showProductListItemsVC(model: ListModel.Response.GetAddProductList, fromCreate: Bool) {
        let vc = factory.makeProductListItems()
        vc.viewModel.addProductListModel = model
        vc.fromCreate = fromCreate
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.onCollectProductAction = showCollectProductListVC
        router.push(vc, hideBottomBar: true)
    }
    
    func showCollectProductListVC(id: String) {
        let vc = factory.makeCollectProductVC()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.listId = id
        router.push(vc, hideBottomBar: true)
    }
}

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
        mainVC.viewModel.OnCategoryAction = showSubCategory
        mainVC.viewModel.OnBannerAction = showBanner
        mainVC.viewModel.OnProductAction = showMainDetail
        router.setRootModule(mainVC, hideBar: true)
    }
    
    func showSubCategory(model: [MainModels.Response.SubCategories], text: String) {
        let vc = SubCategoryBuilder(services: services).build()
        vc.viewModel.onBackAction = router.popModule
        vc.text = text
        vc.viewModel.model = model
        vc.viewModel.onMainProductVC = showMainProducts
        router.push(vc, hideBottomBar: true)
    }
    
    func showBanner(model: MainModels.Response.Banner) {
        let vc = BannerBuilder(services: services).build()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.model = model
        router.push(vc, hideBottomBar: true)
    }
    
    func showMainDetail(model: MainModels.Response.Products) {
        let vc = MainDetailBuilder(services: services).build()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.product = model
        vc.viewModel.OnProductAction = showMainDetail
        router.push(vc, hideBottomBar: true)
    }
    
    func showMainProducts(id: Int) {
        let vc = MainProductsBuilder(services: services).build()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.OnProductAction = showMainDetail
        vc.viewModel.id = id
        router.push(vc, hideBottomBar: true)
    }
}

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let router: Router
    var services: ApiServices
    
    init(router: Router, services: ApiServices) {
        self.router = router
        self.services = services
        super.init()
    }
    
    override func start(with option: DeepLinkOption? = nil) {
        showMainApp()
    }
    
    private func showMainScreen() {
        let mainVC = MainBuilder(services: services).build()
        router.setRootModule(mainVC)
    }

    private func showSearchScreen() {
        let searchVM = SearchVM()
        searchVM.onBackAction = { [weak self] in
            self?.router.dismissModule()
        }
        searchVM.onProductTapped = { [weak self] product in
            self?.showProductDetail(product)
        }
        
        let searchVC = SearchVC(viewModel: searchVM)
        let navController = UINavigationController(rootViewController: searchVC)
        router.present(navController)
    }
    
    private func showMainApp() {
        let tabBarVC = TabBarBuilder.build(services: services)
        router.setRootModule(tabBarVC, hideBar: true)
    }
    
    private func showProductDetail(_ product: MainModels.Response.Banner) {
        
    }
}

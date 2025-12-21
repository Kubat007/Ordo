import UIKit

final class AppCoordinator: BaseCoordinator {
    private let coordinatorFactory: AppCoordinatorFactory
    private let router: Router
    var services: Services
    
    init(router: Router, coordinatorFactory: AppCoordinatorFactory, services: Services) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.services = services
        super.init()
    }
    
    override func start(with option: DeepLinkOption? = nil) {
        showMainApp()
    }
    
//    private func showMainApp() {
//        let tabBarVC = TabBarBuilder.build(services: services)
//        router.setRootModule(tabBarVC, hideBar: true)
//    }
    
    private func showMainApp() {
            let (tabbarCoordinator, tabbarController) = coordinatorFactory.makeTabbarCoordinator(services: services)
            self.addDependency(tabbarCoordinator)
            tabbarCoordinator.start()
            router.setRootModule(tabbarController, hideBar: true)
        }
    
    private func showProductDetail(_ product: MainModels.Response.Banner) {
        
    }
}

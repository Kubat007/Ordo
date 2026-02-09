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
    
    override func start() {
        showSplashScreen()
    }
    
    private func showSplashScreen() {
        let splashVM = SplashVM()
        let splashVC = SplashVC(viewModel: splashVM)
        splashVM.delegate = self
        router.setRootModule(splashVC, hideBar: true)
    }
    
    private func showMainApp() {
        let (tabbarCoordinator, tabbarController) = coordinatorFactory.makeTabbarCoordinator(services: services)
        self.addDependency(tabbarCoordinator)
        tabbarCoordinator.start()
        if let splashVC = router.toPresent() as? SplashVC {
            splashVC.fadeOut { [weak self] in
                self?.router.setRootModule(tabbarController, hideBar: true)
            }
        } else {
            self.router.setRootModule(tabbarController, hideBar: true)
        }
    }
}

// MARK: - SplashVMDelegate
extension AppCoordinator: SplashVMDelegate {
    func splashAnimationCompleted() {
        showMainApp()
    }
}

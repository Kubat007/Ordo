//
//  TabbarCoordinator.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class TabbarCoordinator: BaseCoordinator, TabbarCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let tabbarView: TabBarVC
    private let coordinatorFactory: AppCoordinatorFactory
    private let services: Services
    
    init(tabbarView: TabBarVC,
         coordinatorFactory: AppCoordinatorFactory,
         services: Services) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
        self.services = services
    }
    
    override func start() {
        setupTabbarHandlers()
        runInitialFlows()
    }
    
    private func setupTabbarHandlers() {
        tabbarView.onMainFlowSelect = runMainFlow()
        tabbarView.onFavoriteFlowSelect = runFavoriteFlow()
        tabbarView.onProfileFlowSelect = runProfileFlow()
        tabbarView.onMoreFlowSelect = runMoreFlow()
        tabbarView.onProductListFlowSelect = runProductListFlow()
    }
    
    private func runInitialFlows() {
        if let firstNav = tabbarView.viewControllers?.first as? BaseNC {
            runMainFlow()(firstNav)
        }
    }
    
    private func runMainFlow() -> ((BaseNC) -> Void) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self.coordinatorFactory.makeMainCoordinator(navController: navController, services: services)
                coordinator.finishFlow = { [weak self] in
                    self?.finishFlow?()
                }
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    
    private func runFavoriteFlow() -> ((BaseNC) -> Void) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self.coordinatorFactory.makeFavoriteCoordinator(navController: navController, services: services)
                coordinator.finishFlow = { [weak self] in
                    self?.finishFlow?()
                }
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    
    private func runProfileFlow() -> ((BaseNC) -> Void) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self.coordinatorFactory.makeProfileCoordinator(navController: navController, services: services)
                coordinator.finishFlow = { [weak self] in
                    self?.finishFlow?()
                }
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    
    private func runMoreFlow() -> ((BaseNC) -> Void) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self.coordinatorFactory.makeMoreCoordinator(navController: navController, services: services)
                coordinator.finishFlow = { [weak self] in
                    self?.finishFlow?()
                }
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    
    private func runProductListFlow() -> ((BaseNC) -> Void) {
        return { [unowned self] navController in
            let coordinator = self.coordinatorFactory.makeProductListCoordinator(
                navController: navController,
                services: services
            )
            coordinator.finishFlow = { [weak self] in
                self?.finishFlow?()
            }
            self.addDependency(coordinator)
            coordinator.start()
        }
    }
}

//
//  ProfileCoordinator.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class ProfileCoordinator: BaseCoordinator, ProfileCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: ProfileFactory
    private let services: Services
    
    init(router: Router, factory: ProfileFactory, services: Services) {
        self.router = router
        self.factory = factory
        self.services = services
    }
    
    override func start() {
        showMain()
    }
    
    private func showMain() {
        let vc = ProfileBuilder(services: services).build()
        vc.viewModel.onAuthAction = showAuthVC
        vc.viewModel.onNewsAction = showNews
        router.setRootModule(vc, hideBar: true)
    }
    
    func showAuthVC() {
        let vc = factory.makeAuthVC()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.onVerifyAction = showVerifyVC
        router.push(vc, hideBottomBar: true)
    }
    
    func showVerifyVC(phoneNumber: String) {
        let vc = factory.makeVerifyVC()
        vc.viewModel.onBackAction = router.popModule
        vc.viewModel.phoneNumber = phoneNumber
        vc.viewModel.onProfileAction = showMain
        router.push(vc, hideBottomBar: true)
    }
    
    private func showProfileVC() {
        let vc = factory.makeProfileVC()
        router.push(vc)
    }
    
    func showNews() {
        let vc = factory.makeNewsVC()
        vc.viewModel.onBackAction = router.popModule
        router.push(vc, hideBottomBar: true)
    }
}

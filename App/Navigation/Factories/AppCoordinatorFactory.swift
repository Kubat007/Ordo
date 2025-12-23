//
//  AppCoordinatorFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//
import UIKit

protocol AppCoordinatorFactory {
    func makeTabbarCoordinator(services: Services) -> (configurator: Coordinator & TabbarCoordinatorResult, toPresent: Presentable?)
    func makeMainCoordinator(navController: BaseNC?, services: Services) -> Coordinator & MainCoordinatorResult
    func makeFavoriteCoordinator(navController: BaseNC?, services: Services) -> Coordinator & FavoriteCoordinatorResult
    func makeProfileCoordinator(navController: BaseNC?, services: Services) -> Coordinator & ProfileCoordinatorResult
    func makeMoreCoordinator(navController: BaseNC?, services: Services) -> Coordinator & MoreCoordinatorResult
    func makeProductListCoordinator(navController: BaseNC?, services: Services) -> Coordinator & ProductListCoordinatorResult
}

final class AppCoordinatorFactoryImpl: AppCoordinatorFactory {
    func makeTabbarCoordinator(services: Services) -> (configurator: Coordinator & TabbarCoordinatorResult, toPresent: Presentable?) {
        let controller = TabBarVC(services: services)
        let factory = AppCoordinatorFactoryImpl()
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: factory, services: services)
        
        let firstController: BaseNC = {
            let controller = BaseNC()
            controller.navigationBar.isHidden = true
            controller.tabBarItem = UITabBarItem(
                title: "Главная",
                image: UIImage(systemName: "house.fill"),
                tag: 0
            )
            return controller
        }()
        
        let secondController: BaseNC = {
            let controller = BaseNC()
            controller.navigationBar.isHidden = true
            controller.tabBarItem = UITabBarItem(
                title: "Избранное",
                image: UIImage(systemName: "heart.fill"),
                tag: 1
            )
            return controller
        }()
        
        // Пустой контроллер для средней кнопки
        let middleController: BaseNC = {
            let controller = BaseNC()
            controller.tabBarItem = UITabBarItem(title: "", image: nil, tag: 2)
            controller.tabBarItem.isEnabled = false
            return controller
        }()
        
        let fourthController: BaseNC = {
            let controller = BaseNC()
            controller.navigationBar.isHidden = true
            controller.tabBarItem = UITabBarItem(
                title: "корзина",
                image: UIImage(systemName: "cart"),
                tag: 3
            )
            return controller
        }()
        
        let fifthController: BaseNC = {
            let controller = BaseNC()
            controller.navigationBar.isHidden = true
            controller.tabBarItem = UITabBarItem(
                title: "Профиль",
                image: UIImage(systemName: "person.fill"),
                tag: 4
            )
            return controller
        }()
        
        let flows = [firstController, secondController, middleController, fourthController, fifthController]
        
        controller.viewControllers = flows
        return (coordinator, controller)
    }
    
    func makeMainCoordinator(navController: BaseNC?, services: Services) -> Coordinator & MainCoordinatorResult {
        let factory = MainFactoryImpl(services: services)
        return MainCoordinator(router: router(navController), factory: factory, services: services)
    }
    
    func makeFavoriteCoordinator(navController: BaseNC?, services: Services) -> Coordinator & FavoriteCoordinatorResult {
        let factory = FavoriteFactoryImpl(services: services)
        return FavoriteCoordinator(router: router(navController), factory: factory, services: services)
    }
    
    func makeProfileCoordinator(navController: BaseNC?, services: Services) -> Coordinator & ProfileCoordinatorResult {
        let factory = ProfileFactoryImpl(services: services)
        return ProfileCoordinator(router: router(navController), factory: factory, services: services)
    }
    
    func makeMoreCoordinator(navController: BaseNC?, services: Services) -> Coordinator & MoreCoordinatorResult {
        let factory = MoreFactoryImpl(services: services)
        return MoreCoordinator(router: router(navController), factory: factory, services: services)
    }
    
    func makeProductListCoordinator(navController: BaseNC?, services: Services) -> Coordinator & ProductListCoordinatorResult {
        let factory = ProductListFactoryImpl(services: services)
        return ProductListCoordinator(router: router(navController), factory: factory, services: services)
    }
    
    private func router(_ navController: BaseNC?) -> Router {
        return AppRouter(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: BaseNC?) -> BaseNC {
        if let navController = navController { return navController }
        else { return BaseNC() }
    }
}

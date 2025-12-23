import UIKit

final class AppRouter: NSObject, Router {
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func presentPopUp(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        controller.view.backgroundColor = .clear
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overFullScreen
        rootController?.present(controller, animated: true, completion: nil)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func presentPanModal(_ module: PanModalPresentable?) {
        guard let controller = module else { return }
        rootController?.presentPanModal(controller)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?)  {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, onNC: BaseNC) {
        guard let controller = module?.toPresent() else { return }
        onNC.pushViewController(controller, animated: true)
    }
    
    func push(_ module: Presentable?, hideBottomBar: Bool)  {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool)  {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
        else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        
        NotificationCenter.default.post(
                name: NSNotification.Name("HideTabBarButton"),
                object: nil,
                userInfo: ["hide": true]
            )
        
        rootController?.pushViewController(controller, animated: animated)
        
        let originalViewWillDisappear = class_getInstanceMethod(
                UIViewController.self,
                #selector(UIViewController.viewWillDisappear(_:))
            )
            let swizzledViewWillDisappear = class_getInstanceMethod(
                UIViewController.self,
                #selector(UIViewController.tabBarButtonViewWillDisappear(_:))
            )
            if let original = originalViewWillDisappear,
               let swizzled = swizzledViewWillDisappear {
                method_exchangeImplementations(original, swizzled)
            }
    }
    
    func popModule()  {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool)  {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func popModule(to: AnyClass) {
        for controller in rootController!.viewControllers as Array {
            if controller.isKind(of: to) {
                self.rootController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func popModule(onNC: BaseNC) {
        onNC.popViewController(animated: true)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.navigationBar.isHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}

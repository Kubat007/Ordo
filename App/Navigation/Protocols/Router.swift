//
//  Router.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol Router: Presentable {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func presentPopUp(_ module: Presentable?)
    func presentPanModal(_ module: PanModalPresentable?)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, onNC: BaseNC)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popModule(animated: Bool)
    func popModule(onNC: BaseNC)
    func popModule(to: AnyClass)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
    
}

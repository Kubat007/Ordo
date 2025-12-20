//
//  Coordinator.swift
//  Shop.kg
//
//  Created by Kubat Muktarbek on 20/11/25.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    func start(with option: DeepLinkOption?)
}

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}

protocol Router: Presentable {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func popModule()
    func dismissModule()
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
}

enum DeepLinkOption {
    case main
    case auth
}

//
//  BaseNC.swift
//  Shop.kg
//
//  Created by Kubat Muktarbek on 20/11/25.
//

import UIKit

class BaseNC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    /// This method removes all controllers from the stack without unwanted transitions
    func popToRoot() {
        guard let root = viewControllers.first else { return }
        setViewControllers([root], animated: false)
    }
}

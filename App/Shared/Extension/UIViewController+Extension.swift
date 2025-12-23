//
//  UIViewController+Extension.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

extension UIViewController {
    @objc func tabBarButtonViewWillDisappear(_ animated: Bool) {
        self.tabBarButtonViewWillDisappear(animated)
        
        if self.isMovingFromParent {
            NotificationCenter.default.post(
                name: NSNotification.Name("HideTabBarButton"),
                object: nil,
                userInfo: ["hide": false]
            )
        }
    }
}

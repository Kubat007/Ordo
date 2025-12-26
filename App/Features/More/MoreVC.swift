//
//  MoreVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

final class MoreVC: BaseVC<MoreCV, MoreVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        let token = AuthManager.shared.getToken()
        print(token ?? "")
    }
}

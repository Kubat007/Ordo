//
//  ProfileBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import Foundation
import UIKit

final class ProfileBuilder: ModuleBuilder {
    var contentView: ProfileCV
    var viewModel: ProfileVM
    var viewController: ProfileVC
    
    required init(services: Services) {
        contentView = ProfileCV()
        viewModel = ProfileVM()
        viewModel.services = services
        viewController = ProfileVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> ProfileVC {
        return viewController
    }
}

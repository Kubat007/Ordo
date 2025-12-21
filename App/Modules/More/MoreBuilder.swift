//
//  MoreBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import Foundation
import UIKit

final class MoreBuilder: ModuleBuilder {
    var contentView: MoreCV
    var viewModel: MoreVM
    var viewController: MoreVC
    
    required init(services: Services) {
        contentView = MoreCV()
        viewModel = MoreVM()
        viewModel.services = services
        viewController = MoreVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> MoreVC {
        return viewController
    }
}

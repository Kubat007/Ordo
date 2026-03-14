//
//  YandexMapBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/3/26.
//

import Foundation
import UIKit

final class YandexMapBuilder: ModuleBuilder {
    var contentView: YandexMapCV
    var viewModel: YandexMapVM
    var viewController: YandexMapVC
    
    required init(services: Services) {
        contentView = YandexMapCV()
        viewModel = YandexMapVM()
        viewModel.services = services
        viewController = YandexMapVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> YandexMapVC {
        return viewController
    }
}

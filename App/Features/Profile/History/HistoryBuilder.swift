//
//  HistoryBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

final class HistoryBuilder: ModuleBuilder {
    var contentView: HistoryCV
    var viewModel: HistoryVM
    var viewController: HistoryVC
    
    required init(services: Services) {
        contentView = HistoryCV()
        viewModel = HistoryVM()
        viewModel.services = services
        viewController = HistoryVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> HistoryVC {
        return viewController
    }
}

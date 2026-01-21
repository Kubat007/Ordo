//
//  HistoryDetailBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

final class HistoryDetailBuilder: ModuleBuilder {
    var contentView: HistoryDetailCV
    var viewModel: HistoryDetailVM
    var viewController: HistoryDetailVC
    
    required init(services: Services) {
        contentView = HistoryDetailCV()
        viewModel = HistoryDetailVM()
        viewModel.services = services
        viewController = HistoryDetailVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> HistoryDetailVC {
        return viewController
    }
}

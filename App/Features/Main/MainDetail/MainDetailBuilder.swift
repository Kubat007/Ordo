//
//  MainDetailBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

final class MainDetailBuilder: ModuleBuilder {
     var contentView: MainDetailCV
     var viewModel: MainDetailVM
     var viewController: MainDetailVC
    
    required init(services: Services) {
        contentView = MainDetailCV()
        viewModel = MainDetailVM()
        viewModel.services = services
        viewController = MainDetailVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> MainDetailVC {
        return viewController
    }
}

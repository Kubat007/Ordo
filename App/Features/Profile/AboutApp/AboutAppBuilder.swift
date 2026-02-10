//
//  AboutAppBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

final class AboutAppBuilder: ModuleBuilder {
    var contentView: AboutAppCV
    var viewModel: AboutAppVM
    var viewController: AboutAppVC
    
    required init(services: Services) {
        contentView = AboutAppCV()
        viewModel = AboutAppVM()
        viewModel.services = services
        viewController = AboutAppVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> AboutAppVC {
        return viewController
    }
}

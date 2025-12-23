//
//  AuthBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class AuthBuilder: ModuleBuilder {
    var contentView: AuthCV
    var viewModel: AuthVM
    var viewController: AuthVC
    
    required init(services: Services) {
        contentView = AuthCV()
        viewModel = AuthVM()
        viewModel.services = services
        viewController = AuthVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> AuthVC {
        return viewController
    }
}

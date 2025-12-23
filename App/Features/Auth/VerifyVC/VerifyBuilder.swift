//
//  VerifyBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

final class VerifyBuilder: ModuleBuilder {
    var contentView: VerifyCV
    var viewModel: VerifyVM
    var viewController: VerifyVC
    
    required init(services: Services) {
        contentView = VerifyCV()
        viewModel = VerifyVM()
        viewModel.services = services
        viewController = VerifyVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> VerifyVC {
        return viewController
    }
}

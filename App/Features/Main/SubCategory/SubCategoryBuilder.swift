//
//  SubCategoryBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 25/1/26.
//

final class SubCategoryBuilder: ModuleBuilder {
     var contentView: SubCategoryCV
     var viewModel: SubCategoryVM
     var viewController: SubCategoryVC
    
    required init(services: Services) {
        contentView = SubCategoryCV()
        viewModel = SubCategoryVM()
        viewModel.services = services
        viewController = SubCategoryVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> SubCategoryVC {
        return viewController
    }
}

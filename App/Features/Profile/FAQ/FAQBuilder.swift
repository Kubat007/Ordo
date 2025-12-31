//
//  FAQBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

final class FAQBuilder: ModuleBuilder {
    var contentView: FAQCV
    var viewModel: FAQVM
    var viewController: FAQVC
    
    required init(services: Services) {
        contentView = FAQCV()
        viewModel = FAQVM()
        viewModel.services = services
        viewController = FAQVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> FAQVC {
        return viewController
    }
}

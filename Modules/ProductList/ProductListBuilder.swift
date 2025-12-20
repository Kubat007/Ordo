import Foundation
import UIKit

final class ProductListBuilder: ModuleBuilder {
    var contentView: ProductListCV
    var viewModel: ProductListVM
    var viewController: ProductListVC
    
    required init(services: ApiServices) {
        contentView = ProductListCV()
        viewModel = ProductListVM()
        viewModel.services = services
        viewController = ProductListVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> ProductListVC {
        return viewController
    }
}

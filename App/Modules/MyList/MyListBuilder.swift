import Foundation
import UIKit

final class MyListBuilder: ModuleBuilder {
    var contentView: MyListCV
    var viewModel: MyListVM
    var viewController: MyListVC
    
    required init(services: Services) {
        contentView = MyListCV()
        viewModel = MyListVM()
        viewModel.services = services
        viewController = MyListVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> MyListVC {
        return viewController
    }
}

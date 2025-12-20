import Foundation
import UIKit

final class MainBuilder: ModuleBuilder {
     var contentView: MainCV
     var viewModel: MainVM
     var viewController: MainVC
    
    required init(services: ApiServices) {
        contentView = MainCV()
        viewModel = MainVM()
        viewModel.services = services
        viewController = MainVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> MainVC {
        return viewController
    }
}

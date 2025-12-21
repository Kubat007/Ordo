import Foundation
import UIKit

final class FavoriteBuilder: ModuleBuilder {
    var contentView: FavoriteCV
    var viewModel: FavoriteVM
    var viewController: FavoriteVC
    
    required init(services: Services) {
        contentView = FavoriteCV()
        viewModel = FavoriteVM()
        viewModel.services = services
        viewController = FavoriteVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> FavoriteVC {
        return viewController
    }
}

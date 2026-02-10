import Foundation

protocol ProductListVMDelegate: AnyObject {
    func successProductList()
    func failure(with error: String)
}

final class ProductListVM: BaseVM {
    var services: Services!
    var model: ListModel.Response.GetList?
    var onBackAction: DefaultNavigationCallback?
    var onMyListAction: (() -> Void)?
    
    weak var delegate: ProductListVMDelegate?
    
    @MainActor
    func getProductList() {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.list.getProductList()
                self.model = initialize
                self.loadingIndicatorState = .loaded
                self.delegate?.successProductList()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
}

import Foundation

protocol ProductListVMDelegate: AnyObject {
    func successDeleteProductList()
    func successProductList()
    func successAddProductList()
    func failure(with error: String)
}

final class ProductListVM: BaseVM {
    var services: Services!
    var model: ListModel.Response.GetList?
    var addProductListModel: ListModel.Response.GetAddProductList?
    var onBackAction: DefaultNavigationCallback?
    var onMyListAction: ((_ id: Int, _ fromCreate: Bool) -> Void)?
    var onProductListItemsAction: ((_ model: ListModel.Response.GetAddProductList, _ fromCreate: Bool) -> Void)?
    
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
    
    @MainActor
    func addProductList(model: ListModel.Request.AddProductList) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.list.addProductList(model: model)
                self.addProductListModel = initialize
                self.loadingIndicatorState = .loaded
                self.getProductList()
                self.delegate?.successAddProductList()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func deleteProductList(id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                _ = try await self.services.repository.list.deleteProductList(id: id)
                self.loadingIndicatorState = .loaded
                self.getProductList()
                self.delegate?.successDeleteProductList()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

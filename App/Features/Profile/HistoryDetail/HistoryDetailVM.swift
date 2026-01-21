//
//  HistoryDetailVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

protocol HistoryDetailVMDelegate: AnyObject {
    func successOrdersDetail()
    func failure(error: String)
}

final class HistoryDetailVM: BaseVM {
    var services: Services!
    weak var delegate: HistoryDetailVMDelegate?
    var onBackAction: DefaultNavigationCallback?
    var model: CartModel.Response.Order?

    @MainActor
    func getHistoryDetail(id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let response = try await services.repository.cart.getHistoryDetail(id: id)
                loadingIndicatorState = .loaded
                self.model = response
                delegate?.successOrdersDetail()
            } catch {
                loadingIndicatorState = .loaded
                delegate?.failure(error: error.localizedDescription)
            }
        }
    }

    func repeatOrder() {
    }
}

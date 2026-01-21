//
//  HistoryVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

protocol HistoryVMDelegate: AnyObject {
    func successOrders()
    func failure(with error: String)
}

final class HistoryVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    var onHistoryDetailAction: ((_ id: Int) -> Void)?
    weak var delegate: HistoryVMDelegate?

    var orderModel: [CartModel.Response.Order] = []
    
    @MainActor
    func getHistory() {
        loadingIndicatorState = .loading
        Task {
            do {
                let response = try await services.repository.cart.getHistory()
                loadingIndicatorState = .loaded
                self.orderModel = response.results ?? []
                delegate?.successOrders()
            } catch {
                loadingIndicatorState = .loaded
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

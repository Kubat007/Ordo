//
//  MainDetailVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

protocol MainDetailVMDelegate: AnyObject {
    func successSimilarProduct()
    func failure(with error: String)
}

final class MainDetailVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    var productList: [MainModels.Response.Products] = []
    var product: MainModels.Response.Products?
    
    weak var delegate: MainDetailVMDelegate?
    
    @MainActor
    func getSimilarProduct(id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let response = try await services.repository.main.getSimilarProduct(id: id)
                loadingIndicatorState = .loaded
                self.productList = response.results ?? []
                delegate?.successSimilarProduct()
            } catch {
                loadingIndicatorState = .loaded
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

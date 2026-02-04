//
//  MainDetailVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

protocol MainDetailVMDelegate: AnyObject {
    func successSimilarProduct()
    func successBasket()
    func failure(with error: String)
}

final class MainDetailVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    var productList: [MainModels.Response.Products] = []
    var product: MainModels.Response.Products?
    
    var onTestCollectionView: (() -> Void)?
    
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
    
    @MainActor
    func sendFavoriteProduct(productId: Int) {
        Task {
            do {
                _ = try await self.services?.repository.main.sendfavoriteProduct(productId: productId)
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func addCart(model: MainModels.Request.AddCArt) {
        Task {
            do {
                _ = try await self.services?.repository.main.addCart(model: model)
                delegate?.successBasket()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

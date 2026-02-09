//
//  MainProductsVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 9/2/26.
//

protocol MainProductsVMDelegate: AnyObject {
    func successSubCategoryProductes()
    func successBasket()
    func failure(with error: String)
}

final class MainProductsVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    var products: [MainModels.Response.Products] = []
    var OnProductAction: ((_ model: MainModels.Response.Products) -> Void)?
    var id: Int?
    
    weak var delegate: MainProductsVMDelegate?
    
    @MainActor
    func getSubCategoryProduct(id: Int) {
        Task {
            do {
                let initialize = try await self.services?.repository.main.getSubCategoryProducts(id: id)
                self.products = initialize?.results ?? []
                delegate?.successSubCategoryProductes()
            } catch {
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

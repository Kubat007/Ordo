//
//  MoreVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol MoreVMDelegate: AnyObject {
    func successCart()
    func successdeleteCart()
    func failure(with error: String)
}

final class MoreVM: BaseVM {
    var services: Services!
    var cartModel: CartModel.Response.GetCartModel?
    var onOrderAction: (()-> Void)?
    
    weak var delegate: MoreVMDelegate?
    
    @MainActor
    func getCart() {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services?.repository.cart.getCart()
                self.loadingIndicatorState = .loaded
                self.cartModel = initialize
                delegate?.successCart()
            } catch {
                self.loadingIndicatorState = .loaded
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func deleteCart(id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services?.repository.cart.deleteCart(id: id)
                self.loadingIndicatorState = .loaded
                self.cartModel = initialize
                delegate?.successdeleteCart()
            } catch {
                self.loadingIndicatorState = .loaded
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

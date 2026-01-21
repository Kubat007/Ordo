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
    func updateCartQuantity(productId: Int, quantity: Int) {
        guard let items = cartModel?.items else { return }
        if let index = items.firstIndex(where: { $0.product_id == productId }) {
            cartModel?.items?[index].quantity = quantity
            recalculateTotals()
            updateCartOnServer(productId: productId, quantity: quantity)
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
    
    private func recalculateTotals() {
        guard let items = cartModel?.items else { return }
        var totalItems = 0
        var totalPrice = 0.0
        for item in items {
            let quantity = item.quantity ?? 0
            let price = item.product_price ?? 0
            totalItems += quantity
            totalPrice += Double(quantity * price)
        }
        
        cartModel?.total_items = totalItems
        cartModel?.total_price = Int(totalPrice)
    }
    
    @MainActor
    private func updateCartOnServer(productId: Int, quantity: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let model = MainModels.Request.AddCArt(
                    product_id: productId,
                    quantity: quantity
                )
                _ = try await self.services?.repository.main.addCart(model: model)
                self.loadingIndicatorState = .loaded
                self.delegate?.successCart()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

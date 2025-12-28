//
//  MoreVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol MoreVMDelegate: AnyObject {
    func successCart()
    func failure(with error: String)
}

final class MoreVM: BaseVM {
    var services: Services!
    var cartModel: CartModel.Response.GetCartModel?
    
    
    weak var delegate: MoreVMDelegate?
    
    @MainActor
    func getCart() {
        Task {
            do {
                let initialize = try await self.services?.repository.cart.getCart()
                self.cartModel = initialize
                delegate?.successCart()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

//
//  CartRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

protocol CartRepository {
    func getCart() async throws -> CartModel.Response.GetCartModel
    func deleteCart(id: Int) async throws -> CartModel.Response.GetCartModel
    func order(model: CartModel.Request.OrderRequest) async throws -> CartModel.Response.Order
    func getHistory() async throws -> BaseArrayModel<CartModel.Response.Order>
    func getHistoryDetail(id: Int) async throws -> CartModel.Response.Order
}

//
//  CartRemoteRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

import Foundation
import RealHTTP

final class CartRemoteRepository: CartRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getCart() async throws -> CartModel.Response.GetCartModel {
        try await client.fetch(CartApi.GetCart())
    }
    
    func deleteCart(id: Int) async throws -> CartModel.Response.GetCartModel {
        try await client.fetch(CartApi.DeleteCart(id: id))
    }
    
    func order(model: CartModel.Request.OrderRequest) async throws -> CartModel.Response.Order {
        try await client.fetch(CartApi.Order(model: model))
    }
    
    func getHistory() async throws -> BaseArrayModel<CartModel.Response.Order> {
        try await client.fetch(CartApi.GetHistory())
    }
    
    func getHistoryDetail(id: Int) async throws -> CartModel.Response.Order {
        try await client.fetch(CartApi.GetHistoryDetail(id: id))
    }
}

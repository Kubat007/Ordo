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
}

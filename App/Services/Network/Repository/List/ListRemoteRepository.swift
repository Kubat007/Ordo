//
//  ListRemoteRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

import Foundation
import RealHTTP

final class ListRemoteRepository: ListRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getProductList() async throws -> ListModel.Response.GetList? {
        try await client.fetch(ListApi.GetList())
    }
}


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
    
    func addProductList(model: ListModel.Request.AddProductList) async throws -> ListModel.Response.GetAddProductList? {
        try await client.fetch(ListApi.AddProductList(model: model))
    }
    
    func deleteProductList(id: Int) async throws -> EmptyResponse {
        try await client.fetch(ListApi.DeleteProductList(id: id))
    }
    
    func changeProductList(model: ListModel.Request.SendChangeProductList, id: Int) async throws -> ListModel.Response.GetChangedProductList? {
        try await client.fetch(ListApi.GetChangeProductList(model: model, id: id))
    }
    
    func getCollectProductList(model: ListModel.Request.SendCollectProductList) async throws -> ListModel.Response.GetCollectProductList? {
        try await client.fetch(ListApi.GetCollectProductList(model: model))
    }
    
    func getDetailProductList(id: Int) async throws -> ListModel.Response.GetDetailProductListModel? {
        try await client.fetch(ListApi.GetDetailProductList(id: id))
    }
}


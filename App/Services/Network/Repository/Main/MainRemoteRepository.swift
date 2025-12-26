import Foundation
import RealHTTP
import UIKit


final class MainRemoteRepository: MainRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func sendfavoriteProduct(productId: Int) async throws -> MainModels.Response.SendFavorite {
        try await client.fetch(MainApi.SendFavorite(product: productId))
    }
    
    func getCategory() async throws -> [MainModels.Response.Category] {
        try await client.fetch(MainApi.GetCategory())
    }
    
    func getProducts() async throws -> BaseArrayModel<MainModels.Response.Products> {
        try await client.fetch(MainApi.GetProducts())
    }
    
    func getBanner() async throws -> [MainModels.Response.Banner] {
        try await client.fetch(MainApi.GetBanner())
    }
    
    func getFavorites() async throws -> BaseArrayModel<MainModels.Response.GetFavorites> {
        try await client.fetch(MainApi.GetFavorites())
    }
    
    func deleteFavorite(productId: Int) async throws -> EmptyResponse {
        try await client.fetch(MainApi.DeleteFavorite(productId: productId))
    }
}


import Foundation
import RealHTTP
import UIKit


final class MainRemoteRepository: MainRepository {
    func sendfavoriteProduct(productId: Int) async throws -> MainModels.Response.SendFavorite {
        try await client.fetch(MainApi.SendFavorite(productId: productId))
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
    
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
}


import RealHTTP

protocol MainRepository {
    func getBanner() async throws -> [MainModels.Response.Banner]
    func getProducts() async throws -> BaseArrayModel<MainModels.Response.Products>
    func getCategory() async throws -> [MainModels.Response.Category]
    func sendfavoriteProduct(productId: Int) async throws -> MainModels.Response.SendFavorite
    func getFavorites() async throws -> BaseArrayModel<MainModels.Response.GetFavorites>
    func deleteFavorite(productId: Int) async throws -> EmptyResponse
    func addCart(model: MainModels.Request.AddCArt) async throws -> BaseIntModel
}


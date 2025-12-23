import RealHTTP

protocol MainRepository {
    func getBanner() async throws -> [MainModels.Response.Banner]
    func getProducts() async throws -> BaseArrayModel<MainModels.Response.Products>
    func getCategory() async throws -> [MainModels.Response.Category]
    func sendfavoriteProduct(productId: Int) async throws -> MainModels.Response.SendFavorite
//    func getProductDetail(id: String) async throws -> BaseModel<Product>
//    func getCategories() async throws -> BaseArrayModel<Category>
}


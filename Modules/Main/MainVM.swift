protocol MainVMDelegate: AnyObject {
    func successBanners()
    func successProductes()
    func successCategory()
    func failure(with error: String)
}

final class MainVM: BaseVM {
    var onProductTapped: ((MainModels.Response.Banner) -> Void)?
    var onSearchTapped: (() -> Void)?
    var services: ApiServices!
    var bannerList: [MainModels.Response.Banner] = []
    var productList: [MainModels.Response.Products] = []
    var categoryList: [MainModels.Response.Category] = []
    
    weak var delegate: MainVMDelegate?
    
    @MainActor
    func getBanner() {
        Task {
            do {
                let initialize = try await self.services?.repository.main.getBanner()
                self.bannerList = initialize ?? []
                delegate?.successBanners()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func getProduct() {
        Task {
            do {
                let initialize = try await self.services?.repository.main.getProducts()
                self.productList = initialize?.results ?? []
                delegate?.successProductes()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func getCategory() {
        Task {
            do {
                let initialize = try await self.services?.repository.main.getCategory()
                self.categoryList = initialize ?? []
                delegate?.successCategory()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func sendFavoriteProduct(productId: Int) {
        // TODO: Implement proper favorite product sending logic
        // For now, we just avoid reloading the entire collection
        // which causes the button state to reset
        print("Favorite product with ID \(productId) toggled")
    }
}

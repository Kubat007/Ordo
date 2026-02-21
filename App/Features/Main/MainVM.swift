import Foundation
protocol MainVMDelegate: AnyObject {
    func successBanners()
    func successProductes()
    func successCategory()
    func successBasket()
    func successDeleteFavorite()
    func successAddedFavorite()
    func failure(with error: String)
}

final class MainVM: BaseVM {
    var onProductTapped: ((MainModels.Response.Banner) -> Void)?
    var onSearchTapped: (() -> Void)?
    var OnCategoryAction: ((_ model: [MainModels.Response.SubCategories], _ text: String) -> Void)?
    var OnBannerAction: ((_ model: MainModels.Response.Banner) -> Void)?
    var OnProductAction: ((_ model: MainModels.Response.Products) -> Void)?
    
    var services: Services!
    
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
        Task {
            do {
                let response = try await self.services?.repository.main.sendfavoriteProduct(productId: productId)
                if let index = self.productList.firstIndex(where: { $0.id == productId }) {
                    self.productList[index].is_favorite = true
                    self.productList[index].favorite_id = response?.favorite_id
                }
                delegate?.successAddedFavorite()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func addCart(model: MainModels.Request.AddCArt) {
        Task {
            do {
                _ = try await self.services?.repository.main.addCart(model: model)
                delegate?.successBasket()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func deleteFavorite(productId: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                _ = try await self.services.repository.main.deleteFavorite(id: productId)
                self.loadingIndicatorState = .loaded
                if let index = self.productList.firstIndex(where: { $0.favorite_id == productId }) {
                    self.productList[index].is_favorite = false
                    self.productList[index].favorite_id = nil
                }
                self.delegate?.successDeleteFavorite()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

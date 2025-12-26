
protocol FavoriteVMDelegate: AnyObject {
    func successFavorite()
    func successDeleteFavorite()
    func failure(with error: String)
}

final class FavoriteVM: BaseVM {
    var services: Services!
    weak var delegate: FavoriteVMDelegate?
    var favoriteList: [MainModels.Response.GetFavorites] = []
    
    @MainActor
    func getFavorites() {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.main.getFavorites()
                self.favoriteList = initialize.results ?? []
                self.loadingIndicatorState = .loaded
                self.delegate?.successFavorite()
            } catch {
                self.loadingIndicatorState = .loaded
                print(error)
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func deleteFavorite(productId: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                _ = try await self.services.repository.main.deleteFavorite(productId: productId)
                self.loadingIndicatorState = .loaded
                self.favoriteList.removeAll { $0.id == productId }
                self.delegate?.successDeleteFavorite()
            } catch {
                self.loadingIndicatorState = .loaded
                print(error)
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

//
//  CollectProductListVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

protocol CollectProductListVMDelegate: AnyObject {
    func successCollectItems()
    func successBasket()
    func failure(with error: String)
}

import Foundation

final class CollectProductListVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    var listId: String?
    var collectItemsModel: ListModel.Response.GetCollectProductList?
    weak var delegate: CollectProductListVMDelegate?
    
    // MARK: - Computed Properties
    var sections: [ListModel.Response.CollectSection] {
        return collectItemsModel?.results ?? []
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        let products = sections[section].products ?? []
        return max(products.count, 1)
    }
    
    func titleForSection(_ section: Int) -> String {
        guard section < sections.count else { return "" }
        return sections[section].title ?? "Без названия"
    }
    
    func productAt(indexPath: IndexPath) -> ListModel.Response.GetCollectProductItems? {
        guard indexPath.section < sections.count,
              let products = sections[indexPath.section].products,
              indexPath.row < products.count else {
            return nil
        }
        return products[indexPath.row]
    }
    
    func isSectionEmpty(_ section: Int) -> Bool {
        guard section < sections.count else { return true }
        return sections[section].products?.isEmpty ?? true
    }
    
    // MARK: - API Calls
    @MainActor
    func fetchCollectItems() {
        guard let listId = listId else {
            delegate?.failure(with: "ID списка не найден")
            return
        }
        let model = ListModel.Request.SendCollectProductList(list_id: listId)
        loadingIndicatorState = .loading
        Task {
            do {
                let response = try await self.services.repository.list.getCollectProductList(model: model)
                self.collectItemsModel = response
                self.loadingIndicatorState = .loaded
                self.delegate?.successCollectItems()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
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
    
    // MARK: - Favorite Methods
    @MainActor
    func sendFavoriteProduct(productId: Int) {
        Task {
            do {
                let response = try await self.services?.repository.main.sendfavoriteProduct(productId: productId)
                // Обновляем модель - ищем продукт по ID и меняем is_favorite
                updateProductFavoriteStatus(id: productId, isFavorite: true, favoriteId: response?.favorite_id)
                delegate?.successCollectItems()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func deleteFavorite(id: Int, favId: Int) {
        Task {
            do {
                _ = try await self.services?.repository.main.deleteFavorite(id: favId)
                updateProductFavoriteStatus(id: favId, isFavorite: false, favoriteId: nil)
                NotificationCenter.default.post(name: .favoriteChanged, object: nil,  userInfo: ["id": id, "productId": favId, "isFavorite": false])
                delegate?.successCollectItems()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Helper Methods
    private func updateProductFavoriteStatus(id: Int, isFavorite: Bool, favoriteId: Int?) {
        for sectionIndex in 0..<sections.count {
            if let productIndex = collectItemsModel?.results?[sectionIndex].products?.firstIndex(where: { $0.id == id }) {
                collectItemsModel?.results?[sectionIndex].products?[productIndex].is_favorite = isFavorite
                collectItemsModel?.results?[sectionIndex].products?[productIndex].favorite_id = favoriteId
                break
            }
        }
    }
}

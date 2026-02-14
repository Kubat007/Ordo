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
    var sections: [ListModel.Response.CollectSection] {
        return collectItemsModel?.results ?? []
    }
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        let products = sections[section].products ?? []
        return max(products.count, 1) // 1 - для empty state
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
    
    @MainActor
    func sendFavoriteProduct(productId: Int) {
        Task {
            do {
                _ = try await self.services?.repository.main.sendfavoriteProduct(productId: productId)
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

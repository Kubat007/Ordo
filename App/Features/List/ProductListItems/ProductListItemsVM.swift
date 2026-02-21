//
//  ProductListItemsVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 11/2/26.
//

import Foundation

protocol ProductListItemsVMDelegate: AnyObject {
    func successDetailItems()
    func successChangeItems()
    func successChangeItemsCollect()
    func failure(with error: String)
}

final class ProductListItemsVM: BaseVM {
    var onBackAction: DefaultNavigationCallback?
    var services: Services!
    var onCollectProductAction: ((_ id: String) -> Void)?
    
    var addProductListModel: ListModel.Response.GetAddProductList?
    var changeItemsModel: ListModel.Response.GetChangedProductList?
    var detailProductListModel: ListModel.Response.GetDetailProductListModel?
    // RequestModel
    var sendChangeProductModel: ListModel.Request.SendChangeProductList?
    var sendCollectProductModel: ListModel.Request.SendCollectProductList?
    var id = 0
    
    var items: [String] = []
    
    weak var delegate: ProductListItemsVMDelegate?
    
    private var originalItemsCount: Int = 0
    var hasChanges: Bool = false
    
    func setDetailModel(_ model: ListModel.Response.GetDetailProductListModel) {
        self.detailProductListModel = model
        self.originalItemsCount = model.items?.count ?? 0
        self.hasChanges = false
    }
    
    func addItemDetail(_ text: String) {
        let newItem = ListModel.Response.DetailProductListItems(id: nil, term: text)
        if detailProductListModel?.items != nil {
            detailProductListModel?.items?.append(newItem)
        } else {
            detailProductListModel?.items = [newItem]
        }
        hasChanges = true
    }
    
    func removeItemDetail(at index: Int) {
        guard detailProductListModel?.items != nil,
              index < (detailProductListModel?.items?.count ?? 0) else { return }
        
        detailProductListModel?.items?.remove(at: index)
        hasChanges = true
    }
    
    func checkForChanges() -> Bool {
        let currentCount = detailProductListModel?.items?.count ?? 0
        if currentCount != originalItemsCount {
            return true
        }
        return hasChanges
    }
    
    func addItem(_ text: String) {
        items.append(text)
    }

    func removeItem(at index: Int) {
        guard index < items.count else { return }
        items.remove(at: index)
    }

    func collectItems() {
        print("Список:", items)
    }
    
    @MainActor
    func getDetailProductList(id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.list.getDetailProductList(id: id)
                self.detailProductListModel = initialize
                self.loadingIndicatorState = .loaded
                self.delegate?.successDetailItems()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func changeItems(model: ListModel.Request.SendChangeProductList, id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.list.changeProductList(model: model, id: id)
                self.changeItemsModel = initialize
                self.loadingIndicatorState = .loaded
                self.delegate?.successChangeItems()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func changeItemsCollect(model: ListModel.Request.SendChangeProductList, id: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.list.changeProductList(model: model, id: id)
                self.changeItemsModel = initialize
                self.loadingIndicatorState = .loaded
                self.delegate?.successChangeItemsCollect()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}


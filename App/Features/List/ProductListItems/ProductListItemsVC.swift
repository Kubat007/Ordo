//
//  ProductListItemsVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 11/2/26.
//

import UIKit

final class ProductListItemsVC: BaseVC<ProductListItemsCV, ProductListItemsVM> {
    var fromCreate = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupActions()
        viewModel.delegate = self
        
        if let items = viewModel.sendChangeProductModel?.items {
            viewModel.items = items.compactMap { $0.term }
            contentView.tableView.reloadData()
        }
        if fromCreate {
            
        } else {
            viewModel.getDetailProductList(id: viewModel.id)
        }
    }

    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }

    private func setupActions() {
        contentView.addButton.addTarget(self, action: #selector(onAddTapped), for: .touchUpInside)
        contentView.collectButton.addTarget(self, action: #selector(onCollectTapped), for: .touchUpInside)
        contentView.navigationBar.titleLabel.text = "Список материалов"
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
    }

    @objc private func onAddTapped() {
        guard let text = contentView.textField.text, !text.isEmpty else { return }
        if fromCreate {
            viewModel.addItem(text)
            contentView.textField.text = ""
            contentView.tableView.reloadData()
        } else {
            let newItem = ListModel.Response.DetailProductListItems(id: nil, term: text)
            viewModel.detailProductListModel?.items?.append(newItem)
            contentView.textField.text = ""
            contentView.tableView.reloadData()
        }
    }

    @objc private func onCollectTapped() {
        if fromCreate {
            guard let listId = viewModel.addProductListModel?.id,
                  let listName = viewModel.addProductListModel?.name ?? viewModel.addProductListModel?.name else {
                viewModel.onBackAction?()
                return
            }
            let itemsModel = viewModel.items.map {
                ListModel.Request.SendChangeItemsProducts(term: $0)
            }
            let changeModel = ListModel.Request.SendChangeProductList(
                name: listName,
                items: itemsModel
            )
            viewModel.changeItems(model: changeModel, id: listId)
            viewModel.onCollectProductAction?("\(listId)")
        } else {
            guard let listId = viewModel.detailProductListModel?.id else { return }
            viewModel.onCollectProductAction?("\(listId)")
        }
    }
    
    @objc func onBackAction() {
        if fromCreate {
            guard let listId = viewModel.addProductListModel?.id,
                  let listName = viewModel.addProductListModel?.name ?? viewModel.addProductListModel?.name else {
                viewModel.onBackAction?()
                return
            }
            let itemsModel = viewModel.items.map {
                ListModel.Request.SendChangeItemsProducts(term: $0)
            }
            let changeModel = ListModel.Request.SendChangeProductList(
                name: listName,
                items: itemsModel
            )
            viewModel.changeItems(model: changeModel, id: listId)
            viewModel.onBackAction?()
        }  else {
            guard viewModel.checkForChanges() else { viewModel.onBackAction?()
                        return }
            guard let items = viewModel.detailProductListModel?.items else {
                viewModel.onBackAction?()
                return
            }
            let itemsModel = items.compactMap { item -> ListModel.Request.SendChangeItemsProducts? in
                guard let term = item.term else { return nil }
                return ListModel.Request.SendChangeItemsProducts(term: term)
            }
            if let listId = viewModel.detailProductListModel?.id, let listName = viewModel.detailProductListModel?.name ?? viewModel.addProductListModel?.name {
                let changeModel = ListModel.Request.SendChangeProductList(
                    name: listName,
                    items: itemsModel
                )
                viewModel.changeItems(model: changeModel, id: listId)
                viewModel.onBackAction?()
            }
        }
    }
}

extension ProductListItemsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fromCreate ? viewModel.items.count : viewModel.detailProductListModel?.items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListItemsTVCell.identifier, for: indexPath) as! ProductListItemsTVCell
        if fromCreate {
            cell.configure(text: viewModel.items[indexPath.row], index: indexPath.row)
            cell.onDelete = { [weak self] in
                self?.viewModel.removeItem(at: indexPath.row)
                tableView.reloadData()
            }
        } else {
            if let item = viewModel.detailProductListModel?.items?[indexPath.row] {
                cell.configureDetail(model: item, index: indexPath.row)
            }
            cell.onDelete = { [weak self] in
                self?.viewModel.removeItemDetail(at: indexPath.row)
                tableView.reloadData()
            }
        }
        return cell
    }
}

extension ProductListItemsVC: ProductListItemsVMDelegate {
    func successDetailItems() {
        if let detailModel = viewModel.detailProductListModel {
            viewModel.setDetailModel(detailModel)
        }
        contentView.tableView.reloadData()
    }
    
    func successChangeItems() {
        toast(with: "Изменения сохранены", messageType: .success)
    }
        
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}

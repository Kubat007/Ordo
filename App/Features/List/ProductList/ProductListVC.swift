import UIKit
import Foundation

final class ProductListVC: BaseVC<ProductListCV, ProductListVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTableView()
        setupAddButton()
        contentView.navigationBar.titleLabel.text = "Мой список"
        viewModel.getProductList()
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
    }
    
    private func setupAddButton() {
        contentView.onAddListTapped = { [weak self] in
            self?.showCreateListAlert()
        }
    }
    
    private func showCreateListAlert() {
        let alert = UIAlertController(title: "Введите названия списка", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите имя"
        }
        let createAction = UIAlertAction(title: "ДАЛЕЕ", style: .default) { [weak self, weak alert] _ in
            guard let textField = alert?.textFields?.first,
                  let listName = textField.text,
                  !listName.isEmpty else {
                return
            }
            let model = ListModel.Request.AddProductList(
                name: textField.getCleanText()
            )
            self?.viewModel.addProductList(model: model)
        }
        let cancelAction = UIAlertAction(title: "ОТМЕНА", style: .cancel)
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension ProductListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTVCell", for: indexPath) as? ProductListTVCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.model?.results?[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onMyListAction?(viewModel.model?.results?[indexPath.row].id ?? 0, false)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completion in
            self?.viewModel.deleteProductList(id: self?.viewModel.model?.results?[indexPath.row].id ?? 0)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension ProductListVC: ProductListTVCellDelegate {
    func deleteTapped(cell: ProductListTVCell, id: Int) {
        UIAlertController.showSelectionDeleteAlert(
            "Вы уверены, что хотите удалить товар?",
            title: "Подтверждение удаления",
            handler: { [weak self] _ in
                self?.viewModel.deleteProductList(id: id)
            }
        )
    }
}

extension ProductListVC: ProductListVMDelegate {
    func successDeleteProductList() {
        toast(with: "Продукт удален", messageType: .success)
        contentView.tableView.performBatchUpdates({
            contentView.tableView.reloadData()
        }, completion: nil)
        updateEmty()
    }
    
    func successAddProductList() {
        updateEmty()
        guard let model = viewModel.addProductListModel else { return }
        viewModel.onProductListItemsAction?(model, true)
    }
    
    func successProductList() {
        updateEmty()
        contentView.tableView.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: "Ошибка: \(error)", messageType: .error)
    }
    
    func updateEmty() {
        if viewModel.model?.results?.isEmpty ?? false {
            contentView.setEmptyState(isEmpty: true)
        } else {
            contentView.setEmptyState(isEmpty: false)
        }
    }
}

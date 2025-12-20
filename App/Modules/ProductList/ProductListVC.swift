import UIKit
import Foundation

final class ProductListVC: BaseVC<ProductListCV, ProductListVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTableView()
        setupAddButton()
        
        title = "Список продуктов"
        view.backgroundColor = .systemBackground
        viewModel.loadProducts()
        print("test")
        print("какого хуя гит не видит изменнеия?")
        print("test")
        print("chatgpt хуесос")
        
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    private func setupAddButton() {
        contentView.onAddTapped = { [weak self] in
            self?.viewModel.addNewProduct()
        }
        
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
            self?.viewModel.createNewList(name: listName)
        }
        let cancelAction = UIAlertAction(title: "ОТМЕНА", style: .cancel)
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTVCell", for: indexPath) as? ProductListTVCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.products[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProductListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = viewModel.products[indexPath.row]
        print("Selected product: \(product.name)")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completion in
            self?.viewModel.deleteProduct(at: indexPath.row)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

// MARK: - ProductListTVCellDelegate
extension ProductListVC: ProductListTVCellDelegate {
    func deleteTapped(cell: ProductListTVCell) {
        guard let indexPath = contentView.tableView.indexPath(for: cell) else { return }
        UIAlertController.showSelectionDeleteAlert(
            "Вы уверены, что хотите удалить товар?",
            title: "Подтверждение удаления",
            handler: { [weak self] _ in
                self?.viewModel.deleteProduct(at: indexPath.row)
                self?.toast(with: "Продукт удален", messageType: .success)
            }
        )
    }
}

// MARK: - ProductListVMDelegate
extension ProductListVC: ProductListVMDelegate {
    func navigateToMyList(listName: String) {
//             Навигация к MyListVC через координатор или напрямую
//        let myListVC = MyListVC(coder: <#NSCoder#>)
//            myListVC.viewModel.listName = listName
//        navigationController?.pushViewController(myListVC, animated: true)
        }
    
    func didUpdateProducts() {
        let isEmpty = viewModel.products.isEmpty
        contentView.setEmptyState(isEmpty: isEmpty)
        contentView.tableView.reloadData()
    }
    
    func didAddProduct(at index: Int) {
        contentView.setEmptyState(isEmpty: false)
        let indexPath = IndexPath(row: index, section: 0)
        contentView.tableView.insertRows(at: [indexPath], with: .automatic)
        toast(with: "Продукт добавлен", messageType: .success)
    }
    
    func didDeleteProduct(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        contentView.tableView.deleteRows(at: [indexPath], with: .fade)
        
        // Показываем empty state если список пуст
        if viewModel.products.isEmpty {
            contentView.setEmptyState(isEmpty: true)
        }
    }
    
    func failure(with error: String) {
        toast(with: "Ошибка: \(error)", messageType: .error)
    }
}

//https://gitlab.com/melbrus642/ordo-market.git

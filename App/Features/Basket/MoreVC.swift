//
//  MoreVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

final class MoreVC: BaseVC<MoreCV, MoreVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = "Корзина"
        setupTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        viewModel.getCart()
        contentView.checkoutView.isHidden = viewModel.cartModel?.items?.isEmpty ?? true
    }
    
    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.checkoutButton.addTarget(self, action: #selector(checkoutButtonAction), for: .touchUpInside)
    }
    
    @objc func checkoutButtonAction() {
        viewModel.onOrderAction?()
    }
}

extension MoreVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartModel?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreTVCell.identifier, for: indexPath) as! MoreTVCell
        if let model = viewModel.cartModel {
            cell.setup(model: model, itemIndex: indexPath.row)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}

extension MoreVC: MoreVMDelegate {
    func successdeleteCart() {
        toast(with: "Удален нахуй", messageType: .success)
        contentView.checkoutView.isHidden = viewModel.cartModel?.items?.isEmpty ?? true
        contentView.tableView.reloadData()
    }
    
    func successCart() {
        contentView.checkoutView.isHidden = viewModel.cartModel?.items?.isEmpty ?? true
        contentView.tableView.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}

extension MoreVC: MoreTVCellDelegate {
    func deleteButtonTappet(model: CartModel.Response.Items) {
        let popup = DeletePopUp()
        popup.modalPresentationStyle = .overFullScreen
        popup.configure(
            DeletePopUpModel(
                title: "Удалить товар с корзины?",
                productName: model.product_title ?? "",
                price: "\(model.product_price ?? 0)",
                image: model.product_image
            )
        )
        popup.onDelete = {
            self.viewModel.deleteCart(id: model.id ?? 0)
            self.dismiss(animated: true)
        }
        popup.onCancel = { }
        present(popup, animated: false)

    }
}

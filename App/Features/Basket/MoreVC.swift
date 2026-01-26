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
        contentView.navigationBar.titleLabel.text = "Корзина"
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
    
    private func updateUI() {
        guard let cartModel = viewModel.cartModel else { return }
        let isEmpty = cartModel.items?.isEmpty ?? true
        
        contentView.tableView.isHidden = isEmpty
        contentView.checkoutView.isHidden = isEmpty
        contentView.container.isHidden = !isEmpty
        
        contentView.checkoutButton.setTitle(
            "К оформлению\n\(cartModel.total_items ?? 0) шт. | \(cartModel.total_price ?? 0) KGS",
            for: .normal
        )
        contentView.checkoutView.isHidden = isEmpty
        contentView.tableView.reloadData()
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
        contentView.checkoutButton.setTitle("К оформлению\n \(viewModel.cartModel?.total_items ?? 0) шт. | \(viewModel.cartModel?.total_price ?? 0) KGS", for: .normal)
        updateUI()
        contentView.tableView.reloadData()
    }
    
    func successCart() {
        contentView.checkoutView.isHidden = viewModel.cartModel?.items?.isEmpty ?? true
        contentView.checkoutButton.setTitle("К оформлению\n \(viewModel.cartModel?.total_items ?? 0) шт. | \(viewModel.cartModel?.total_price ?? 0) KGS", for: .normal)
        updateUI()
        contentView.tableView.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}

extension MoreVC: MoreTVCellDelegate {
    func plusButtonTappet(cell: MoreTVCell) {
        guard let indexPath = contentView.tableView.indexPath(for: cell),
              let items = viewModel.cartModel?.items,
              indexPath.row < items.count else { return }
        let item = items[indexPath.row]
        let currentQuantity = item.quantity ?? 0
        let newQuantity = currentQuantity + 1
        viewModel.updateCartQuantity(
            productId: item.product_id ?? 0,
            quantity: newQuantity
        )
        updateUI()
    }
    
    func minusButtonTappet(cell: MoreTVCell) {
        guard let indexPath = contentView.tableView.indexPath(for: cell),
              let items = viewModel.cartModel?.items,
              indexPath.row < items.count else { return }
        let item = items[indexPath.row]
        let currentQuantity = item.quantity ?? 0
        guard currentQuantity > 1 else { return }
        let newQuantity = currentQuantity - 1
        viewModel.updateCartQuantity(
            productId: item.product_id ?? 0,
            quantity: newQuantity
        )
        updateUI()
    }
    
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
        popup.onDelete = { [weak self] in
            guard let self else { return }
            self.viewModel.deleteCart(id: model.id ?? 0)
            self.dismiss(animated: true)
        }
        popup.onCancel = { [weak self] in
            guard let self else { return }
            present(popup, animated: false)
        }
    }
}

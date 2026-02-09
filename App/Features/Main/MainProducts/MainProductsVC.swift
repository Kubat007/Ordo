//
//  MainProductsVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 9/2/26.
//

import UIKit

final class MainProductsVC: BaseVC<MainProductsCV, MainProductsVM> {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getSubCategoryProduct(id: viewModel.id ?? 0)
        viewModel.delegate = self
    }

    private func setup() {
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
    }

    @objc private func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension MainProductsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainProductsCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(viewModel.products[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.OnProductAction?(viewModel.products[indexPath.row])
    }
}

extension MainProductsVC: MainProductsVMDelegate {
    func successBasket() {
        toast(with: "Добавлено в корзину", messageType: .success)
    }
    
    func successSubCategoryProductes() {
        contentView.collectionView.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}

extension MainProductsVC: MainProductsCVCellDelegate {
    func favTapped(cell: MainProductsCVCell, productId: Int) {
        let isFavorite = cell.favButton.tintColor == .red
        let message = isFavorite ? "Добавлено в избранное" : "Удалено из избранного"
        toast(with: message, messageType: isFavorite ? .success : .warning)
        isFavorite ? viewModel.sendFavoriteProduct(productId: productId) : print("Запрос на удаление")
    }
    
    func basketTapped(cell: MainProductsCVCell, model: MainModels.Response.Products?) {
        let sheet = BottomSheetCart()
        let bottomModel = BottomSheetCartModel(
            title: model?.title ?? "",
            price: "\(model?.price ?? 0)", currencyName: model?.currency_name ?? "",
            image: model?.images_gallery.first?.image ?? "",
            count: 1
        )
        sheet.configure(bottomModel)
        sheet.onAddToCart = { [weak self] quantity in
            guard let self = self else { return }
            let cartModel = MainModels.Request.AddCArt(
                product_id: model?.id,
                quantity: quantity
            )
            self.viewModel.addCart(model: cartModel)
        }
        sheet.modalPresentationStyle = .overFullScreen
        present(sheet, animated: false)
    }
}

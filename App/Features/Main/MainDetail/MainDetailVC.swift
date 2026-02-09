//
//  MainDetailVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

import UIKit

final class MainDetailVC: BaseVC<MainDetailCV, MainDetailVM> {
    private var isDescriptionExpanded = false
    private var cellSizes: [String: CGSize] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        viewModel.delegate = self
        viewModel.getSimilarProduct(id: viewModel.product?.id ?? 0)
    }
    
    private func setupCollection() {
        contentView.navigationBar.titleLabel.text = ""
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
        contentView.bottomButton.addTarget(self, action: #selector(basketAction), for: .touchUpInside)
        
        contentView.collectionView.showsVerticalScrollIndicator = false
        DispatchQueue.main.async {
            self.contentView.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
    
    @objc func basketAction() {
        let sheet = BottomSheetCart()
        let bottomModel = BottomSheetCartModel(
            title: viewModel.product?.title ?? "",
            price: "\(viewModel.product?.price ?? 0)", currencyName: viewModel.product?.currency_name ?? "",
            image: viewModel.product?.images_gallery.first?.image ?? "",
            count: 1
        )
        sheet.configure(bottomModel)
        sheet.onAddToCart = { [weak self] quantity in
            guard let self = self else { return }
            let cartModel = MainModels.Request.AddCArt(
                product_id: viewModel.product?.id,
                quantity: quantity
            )
            self.viewModel.addCart(model: cartModel)
        }
        sheet.modalPresentationStyle = .overFullScreen
        present(sheet, animated: false)
    }
}

extension MainDetailVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : (viewModel.productList.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: MainDetailDescriptionCVCell = collectionView.dequeueReusableCell(for: indexPath)
            if let product = viewModel.product {
                cell.configure(product, isExpanded: isDescriptionExpanded)
            }
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        } else {
            let cell: MainDetailCVCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel.productList[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            isDescriptionExpanded.toggle()
            cellSizes.removeAll()
            UIView.performWithoutAnimation {
                collectionView.performBatchUpdates({
                    collectionView.reloadItems(at: [indexPath])
                }, completion: nil)
            }
        } else {
            viewModel.OnProductAction?(viewModel.productList[indexPath.row])
        }
    }
}

extension MainDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: collectionView.frame.width, height: 340) : CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = collectionView.frame.width - 32
            let cacheKey = "\(isDescriptionExpanded)"
            if let cachedSize = cellSizes[cacheKey] {
                return CGSize(width: width, height: cachedSize.height)
            }
            let sizingCell = MainDetailDescriptionCVCell(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            if let product = viewModel.product {
                sizingCell.configure(product, isExpanded: isDescriptionExpanded)
                sizingCell.setNeedsLayout()
                sizingCell.layoutIfNeeded()
            }
            let targetSize = CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)
            let size = sizingCell.contentView.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
            let finalHeight = ceil(size.height) + 1
            cellSizes[cacheKey] = CGSize(width: width, height: finalHeight)
            return CGSize(width: width, height: finalHeight)
        } else {
            let collectionViewWidth = collectionView.frame.width
            let numberOfColumns: CGFloat = 2
            let spacing: CGFloat = 16
            let totalSpacing = spacing * (numberOfColumns + 1) // 16 слева + 16 между колонками + 16 справа
            let availableWidth = collectionViewWidth - totalSpacing
            let width = floor(availableWidth / numberOfColumns)
            return CGSize(width: width, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainDetailHeaderView.defaultReuseIdentifier,
                                                                             for: indexPath) as! MainDetailHeaderView
                if let images = viewModel.product?.images_gallery, let model = viewModel.product {
                    header.configure(images, model: model)
                }
                header.backgroundColor = .clear
                return header
            } else {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView1.defaultReuseIdentifier,
                                                                             for: indexPath) as! CollectionHeaderView1
                header.configure(title: "Похожие объявления")
                header.backgroundColor = .clear
                return header
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension MainDetailVC: MainDetailVMDelegate {
    func successSimilarProduct() {
        contentView.collectionView.reloadData()
        DispatchQueue.main.async {
            self.contentView.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
    
    func successBasket() {
        toast(with: "Добавлено в корзину", messageType: .success)
    }
}

extension MainDetailVC: MainDetailCVCellDelegate {
    func favTapped(cell: MainDetailCVCell, productId: Int) {
        let isFavorite = cell.favButton.tintColor == .red
        let message = isFavorite ? "Добавлено в избранное" : "Удалено из избранного"
        toast(with: message, messageType: isFavorite ? .success : .warning)
        isFavorite ? viewModel.sendFavoriteProduct(productId: productId) : print("Запрос на удаление")
    }
    
    func basketTapped(cell: MainDetailCVCell, model: MainModels.Response.Products?) {
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

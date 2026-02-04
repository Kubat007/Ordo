//
//  MainDetailVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

import UIKit

final class MainDetailVC: BaseVC<MainDetailCV, MainDetailVM> {
    private var isDescriptionExpanded = false
    
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
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension MainDetailVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 1 : viewModel.productList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: MainDetailDescriptionCVCell = collectionView.dequeueReusableCell(for: indexPath)
            if let product = viewModel.product {
                cell.configure(product, isExpanded: isDescriptionExpanded)
//                cell.backgroundColor = .purple
            }
            return cell
        } else {
            let cell: MainDetailCVCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel.productList[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if indexPath.section == 0  {
                isDescriptionExpanded.toggle()
                collectionView.performBatchUpdates {
                    collectionView.collectionViewLayout.invalidateLayout()
                }
            } else {
                viewModel.onTestCollectionView?()
            }
        }
}

extension MainDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: collectionView.frame.width, height: 340) : CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if isDescriptionExpanded {
                return CGSize(width: collectionView.frame.width - 32, height: 400)
            } else {
                return CGSize(width: collectionView.frame.width - 32, height: 100)
            }
        } else {
            let totalSpacing: CGFloat = 16 * 3
            let width = (collectionView.frame.width - totalSpacing) / 2
            return CGSize(width: width, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
        } else {
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainDetailHeaderView.defaultReuseIdentifier,
                for: indexPath) as! MainDetailHeaderView
            if let images = viewModel.product?.images_gallery, let model = viewModel.product {
                header.configure(images, model: model)
            }
            header.backgroundColor = .clear
            return header
        } else if indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView1.defaultReuseIdentifier,
                for: indexPath) as! CollectionHeaderView1
            header.configure(title: "Похожие объявления")
            return header
        } else {
            return UICollectionReusableView()
        }
    }
}

extension MainDetailVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let headerIndexPath = IndexPath(item: 0, section: 0)
        
        if let header = contentView.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: headerIndexPath) as? MainDetailHeaderView {
            header.updateForScroll(offset: max(0, offsetY))
        }
    }
}

extension MainDetailVC: MainDetailVMDelegate {
    func successSimilarProduct() {
        contentView.collectionView.reloadData()
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

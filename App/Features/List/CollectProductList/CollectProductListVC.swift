//
//  CollectProductListVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

import UIKit

final class CollectProductListVC: BaseVC<CollectProductListCV, CollectProductListVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.delegate = self
        viewModel.fetchCollectItems()
    }
    
    private func setup() {
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        contentView.navigationBar.titleLabel.text = "Поиск по списку"
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.collectionView.collectionViewLayout = createLayout()
    }
    
    @objc private func onBack() {
        viewModel.onBackAction?()
    }
    
    private func createLayout() -> UICollectionViewLayout {UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            // Хедер для каждой секции
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(44)
            )
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            // Пустая секция
            if self.viewModel.isSectionEmpty(sectionIndex) {
                let section = self.createEmptyLayout()
                section.boundarySupplementaryItems = [header]
                return section
            }
            
            // Секция с товарами
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .absolute(200),
                heightDimension: .absolute(280)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 12
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 16,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
            section.boundarySupplementaryItems = [header]
            return section
        }
    }
    
    private func createEmptyLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16
        )
        return section
    }
}

// MARK: - UICollectionViewDataSource
extension CollectProductListVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.isSectionEmpty(indexPath.section) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectProductListEmptyCVCell.identifier, for: indexPath
            ) as! CollectProductListEmptyCVCell
            cell.configure(with: "Нет товаров на складе")
            return cell
        }
        
        guard let product = viewModel.productAt(indexPath: indexPath),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectProductListCVCell.identifier, for: indexPath) as? CollectProductListCVCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.configure(with: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectProductListHeaderView.identifier,
            for: indexPath) as! CollectProductListHeaderView
        let title = viewModel.titleForSection(indexPath.section)
        header.configure(with: title)
        return header
    }
}

extension CollectProductListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard !viewModel.products.isEmpty,
//              let product = viewModel.productAt(index: indexPath.row) else {
//            return
//        }
//        print("Selected product: \(product.title ?? "")")
    }
}

// MARK: - CollectProductListVMDelegate
extension CollectProductListVC: CollectProductListVMDelegate {
    func successCollectItems() {
        contentView.collectionView.reloadData()
    }
    
    func successBasket() {
        toast(with: "Добавлено в корзину", messageType: .success)
    }
    
    func failure(with error: String) {
        toast(with: error, messageType: .error)
    }
}

extension CollectProductListVC: CollectProductListCVCellDelegate {
    func favAction(cell: CollectProductListCVCell, productId: Int ) {
        let isFavorite = cell.favoriteButton.tintColor == .red
        let message = isFavorite ? "Добавлено в избранное" : "Удалено из избранного"
        toast(with: message, messageType: isFavorite ? .success : .warning)
        isFavorite ? viewModel.sendFavoriteProduct(productId: productId) : print("Запрос на удаление")
    }
    
    func basketAction(cell: CollectProductListCVCell, model: ListModel.Response.GetCollectProductItems?) {
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

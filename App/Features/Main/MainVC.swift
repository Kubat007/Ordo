import UIKit
import Foundation

final class MainVC: BaseVC<MainCV, MainVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupCollectionView()
        
        title = "Главная"
        view.backgroundColor = .systemBackground
        viewModel.getBanner()
        viewModel.getProduct()
        viewModel.getCategory()
    }
    
    private func setupCollectionView() {
        contentView.mainCollection.dataSource = self
        contentView.mainCollection.delegate = self
        contentView.filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
    }
    
    @objc func filterButtonTapped() {
        let vc = FilterBottomSheetVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return viewModel.categoryList.count
        case 1: return viewModel.bannerList.count
        case 2: return viewModel.productList.count
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell: CategoryCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: viewModel.categoryList[indexPath.row])
            return cell
        case 1:
            let cell: BannersCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: viewModel.bannerList[indexPath.row])
            return cell
        case 2:
            let cell: ProductCell = collectionView.dequeueReusableCell(for: indexPath)
            let product = viewModel.productList[indexPath.row]
            cell.configure(with: product)
            cell.delegate = self
            return cell
        default:
            fatalError("Unknown section")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: viewModel.OnCategoryAction?(viewModel.categoryList[indexPath.row].subcategories ?? [], viewModel.categoryList[indexPath.row].name ?? "")
        case 1: viewModel.OnBannerAction?(viewModel.bannerList[indexPath.row])
        case 2: viewModel.OnProductAction?(viewModel.productList[indexPath.row])
        default: print()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 0 {
                let header = contentView.mainCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView1.defaultReuseIdentifier, for: indexPath) as? CollectionHeaderView1
                header?.configure(title: "Категории")
                return header ?? UIView() as! UICollectionReusableView
            }
            return UICollectionReusableView()
        }
}

extension MainVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}

extension MainVC: MainVMDelegate {
    func successCategory() {
        contentView.mainCollection.reloadData()
    }
    
    func successProductes() {
        contentView.mainCollection.reloadData()
    }
    
    func successBanners() {
        contentView.mainCollection.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: "error \(error.description)", messageType: .error)
    }
    
    func successBasket() {
        toast(with: "Добавлено в корзину", messageType: .success)
    }
}

extension MainVC: ProductCellDelegate {
    func favTapped(cell: ProductCell, productId: Int) {
        let isFavorite = cell.favButton.tintColor == .red
        let message = isFavorite ? "Добавлено в избранное" : "Удалено из избранного"
        toast(with: message, messageType: isFavorite ? .success : .warning)
        isFavorite ? viewModel.sendFavoriteProduct(productId: productId) : print("Запрос на удаление")
    }
    
    func basketTapped(cell: ProductCell, model: MainModels.Response.Products?) {
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

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
}

extension MainVC: ProductCellDelegate {
    func favTapped(cell: ProductCell, productId: Int) {
        // Получаем текущее состояние кнопки до отправки запроса
        let isFavorite = cell.favButton.tintColor == .red
        let message = isFavorite ? "Удалено из избранного" : "Добавлено в избранное"
        toast(with: message, messageType: isFavorite ? .warning : .success)
        viewModel.sendFavoriteProduct(productId: productId)
    }
    
    func basketTapped(cell: ProductCell) {
        toast(with: "Добавлено в корзину", messageType: .success)
    }
}

import UIKit

final class FavoriteVC: BaseVC<FavoriteCV, FavoriteVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.navigationBar.titleLabel.text = "Избранное"
        viewModel.delegate = self
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        viewModel.getFavorites()
    }
    
    private func setupCollectionView() {
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
    }
}

extension FavoriteVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favoriteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(with: viewModel.favoriteList[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension FavoriteVC: FavoriteVMDelegate {
    func successDeleteFavorite() {
        toast(with: "Продукт удален с избранного", messageType: .success)
        contentView.collectionView.reloadData()
    }
    
    func successFavorite() {
        contentView.collectionView.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: error, messageType: .error)
    }
}

extension FavoriteVC: FavoriteCVCellDelegate {
    func basketTapped(cell: FavoriteCVCell) {
        print()
    }
    
    func favTapped(cell: FavoriteCVCell, productId: Int) {
        UIAlertController.showSelectionDeleteAlert("Удалить с избранного".localized, title: "Удаление избранного".localized, handler: { (action) in
            self.viewModel.deleteFavorite(productId: productId)
         }) { (action) in
         }
    }
}

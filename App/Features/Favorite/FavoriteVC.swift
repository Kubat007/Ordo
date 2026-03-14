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
    
    private func updateUI() {
        let favModel = viewModel.favoriteList
        let isEmpty = favModel.isEmpty
        contentView.collectionView.isHidden = isEmpty
        contentView.container.isHidden = !isEmpty
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
        updateUI()
        contentView.collectionView.reloadData()
    }
    
    func successFavorite() {
        updateUI()
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
    
    func favTapped(cell: FavoriteCVCell, id: Int, productId: Int) {
        UIAlertController.showSelectionDeleteAlert("Удалить с избранного".localized, title: "Удаление избранного".localized, handler: { (action) in
            self.viewModel.deleteFavorite(id: id, productId: productId)
         }) { (action) in
         }
    }
}

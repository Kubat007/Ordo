import UIKit

final class FavoriteVC: BaseVC<FavoriteCV, FavoriteVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранное"
        viewModel.delegate = self
        setupContent()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        viewModel.getFavorites()
    }
    
    private func setupCollectionView() {
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
    }
    
    private func setupContent() {
        let label = UILabel()
        label.text = "Избранное"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        contentView.backgroundColor = .white
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

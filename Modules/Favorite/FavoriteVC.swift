import UIKit

final class FavoriteVC: BaseVC<FavoriteCV, FavoriteVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранное"
        setupContent()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
    }
    
    private func setupContent() {
        let label = UILabel()
        label.text = "Избранное"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label // 👈 Автоматически черный/белый для темы
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        contentView.backgroundColor = .systemBlue
    }
}

extension FavoriteVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteCVCell = collectionView.dequeueReusableCell(for: indexPath)
//        cell.setup(with: viewModel.categor`yList[indexPath.row])
        return cell
    }
}

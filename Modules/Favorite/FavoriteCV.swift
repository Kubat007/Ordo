import UIKit

public final class FavoriteCV: UIView {
    lazy var collectionView = makeCollectionView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension FavoriteCV: BaseCV {
    public func setSubviews() {
        addSubview(collectionView)
    }
    
    public func setConstraints() {
        collectionView.anchor(
            .top(topAnchor, constant: 16),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
    }
}

// MARK: - UI Components Factory
private extension FavoriteCV {
    func makeCollectionView() -> UICollectionView {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FavoriteCVCell.self, forCellWithReuseIdentifier: "FavoriteCVCell")
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // ТОЛЬКО ТОВАРЫ: grid с 2 колонками
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            // Item - одна ячейка товара
            let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            // Group - горизонтальная группа из 2х колонок
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200) // 👈Высота карточки товара
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2 // 👈 2 колонки
            )
            group.interItemSpacing = .fixed(16) // 👈 Отступ между колонками
            // Section - вертикальный список групп
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16 // 👈 Отступ между рядами
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16,bottom: 16, trailing: 16)
            return section
        }
        return layout
    }
}

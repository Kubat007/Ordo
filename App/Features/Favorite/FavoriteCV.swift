import UIKit

public final class FavoriteCV: UIView {
    lazy var navigationBar = makeNavigationBar()
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
        addSubview(navigationBar)
        addSubview(collectionView)
    }
    
    public func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        collectionView.anchor(
            .top(navigationBar.bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
    }
}

// MARK: - UI Components Factory
private extension FavoriteCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.backgroundView.backgroundColor = Asset.Colors.f7F7Fe.color
        return navbar
    }
    
    func makeCollectionView() -> UICollectionView {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FavoriteCVCell.self, forCellWithReuseIdentifier: "FavoriteCVCell")
        collectionView.backgroundColor = UIColor(white: 0.96, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(240))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(16)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 20
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16,bottom: 16, trailing: 16)
            return section
        }
        return layout
    }
}

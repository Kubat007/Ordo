import UIKit

public final class FavoriteCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var collectionView = makeCollectionView()
    
    lazy var container = makeView()
    lazy var emtyImage = makeImageView()
    lazy var titleLabel = makeLabel(text: "Пока пусто", textColor: Asset.Colors.black.color, font: Typography.bold14.font)
    lazy var descriptionLabel = makeLabel(text: "Добавляйте объявления в избранное, \nчтобы посмотреть их позже", textColor: Asset.Colors.b1Afc6.color, font: Typography.regular14.font)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(collectionView)
        
        addSubview(container)
        container.addSubview(emtyImage)
        container.addSubview(titleLabel)
        container.addSubview(descriptionLabel)
    }
}

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
    
    func makeView() -> UIView {
        let view = UIView()
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "suit.heart.fill")
        return image
    }
    
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
}

extension FavoriteCV: BaseCV {
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
        
        container.fillSuperview()
        
        emtyImage.anchor(
            .centerY(container.centerYAnchor),
            .centerX(container.centerXAnchor),
            .height(100),
            .width(100)
        )
        
        titleLabel.anchor(
            .top(emtyImage.bottomAnchor, constant: 12),
            .centerX(container.centerXAnchor)
        )

        descriptionLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .centerX(container.centerXAnchor)
        )
    }
}

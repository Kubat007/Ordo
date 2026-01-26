//
//  SubCategoryCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 25/1/26.
//

import UIKit

public final class SubCategoryCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var collectionView = makeCollectionView()
    lazy var layout = makeLayout()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SubCategoryCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(collectionView)
    }
}

extension SubCategoryCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.backgroundView.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return navbar
    }
    
    func makeCollectionView() -> UICollectionView {
        let layout = layout
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SubCategoryCVCell.self, forCellWithReuseIdentifier: "SubCategoryCVCell")
        collectionView.backgroundColor = Asset.Colors.f7F7Fe.color
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .absolute(120))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(16)
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [header]
            section.interGroupSpacing = 16
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 24, trailing: 16)
            return section
        }
    }
    
    func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 12
        let sideInset: CGFloat = 16
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - sideInset * 2 - spacing) / 2
        layout.itemSize = CGSize(width: itemWidth, height: 140)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(
            top: 16,
            left: sideInset,
            bottom: 16,
            right: sideInset
        )
        return layout
    }
}

extension SubCategoryCV {
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
            .bottom(safeAreaLayoutGuide.bottomAnchor)
        )
    }
}

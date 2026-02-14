//
//  CollectProductListCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

import UIKit

public final class CollectProductListCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var collectionView = makeCollectionView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        backgroundColor = Asset.Colors.f7F7Fe.color
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func makeNavigationBar() -> CustomNavigationBar {
        let bar = CustomNavigationBar(style: .small)
        bar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        bar.titleLabel.text = "Поиск по списку"
        bar.backgroundColor = .clear
        return bar
    }
    
    private func makeCollectionView() -> UICollectionView {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = true
        cv.showsHorizontalScrollIndicator = false
        
        // Регистрация ячеек и хедера
        cv.register(CollectProductListCVCell.self,
                   forCellWithReuseIdentifier: CollectProductListCVCell.identifier)
        cv.register(CollectProductListEmptyCVCell.self,
                   forCellWithReuseIdentifier: CollectProductListEmptyCVCell.identifier)
        cv.register(CollectProductListHeaderView.self,
                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                   withReuseIdentifier: CollectProductListHeaderView.identifier)
        
        return cv
    }
}

extension CollectProductListCV: BaseCV {
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
            .bottom(safeAreaLayoutGuide.bottomAnchor)
        )
    }
}

//
//  MainProductsCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 9/2/26.
//

import UIKit

public final class MainProductsCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var collectionView = makeCollectionView()
    lazy var layout = makeLayout()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension MainProductsCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(collectionView)
    }
}

extension MainProductsCV {
    func makeCollectionView() -> UICollectionView {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Asset.Colors.f7F7Fe.color
        cv.showsVerticalScrollIndicator = false
        cv.register(MainProductsCVCell.self,
                    forCellWithReuseIdentifier: "MainProductsCVCell")
        return cv
    }

    func makeNavigationBar() -> CustomNavigationBar {
        let bar = CustomNavigationBar(style: .small)
        bar.backgroundColor = .clear
        bar.backgroundView.backgroundColor = .clear
        bar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return bar
    }
    
    func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let sideInset: CGFloat = 16
        let screenWidth = UIScreen.main.bounds.width

        let itemWidth = (screenWidth - sideInset * 2 - spacing) / 2

        layout.itemSize = CGSize(width: itemWidth, height: 200)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 16, left: sideInset, bottom: 16, right: sideInset)
        return layout
    }
}

extension MainProductsCV {
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

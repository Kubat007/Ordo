//
//  MainDetailCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

import UIKit
import Foundation

final class MainDetailCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var collectionView = makeCollectionView()
    lazy var bottomButton = makeButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension MainDetailCV: BaseCV {
    func setSubviews() {
        addSubview(navigationBar)
        addSubview(collectionView)
        addSubview(bottomButton)
    }
}

extension MainDetailCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.backgroundView.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return navbar
    }
    
    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Asset.Colors.f7F7Fe.color
        cv.register(MainDetailDescriptionCVCell.self, forCellWithReuseIdentifier: "MainDetailDescriptionCVCell")
        cv.register(MainDetailCVCell.self, forCellWithReuseIdentifier: "MainDetailCVCell")
        cv.registerHeaderView(MainDetailHeaderView.self)
        cv.registerHeaderView(CollectionHeaderView1.self)
        return cv
    }

    private func makeButton() -> UIButton {
        let btn = UIButton()
        btn.setTitle("Добавить в корзину", for: .normal)
        btn.backgroundColor = UIColor(red: 0.1, green: 0.16, blue: 0.47, alpha: 1)
        btn.layer.cornerRadius = 14
        return btn
    }
}

extension MainDetailCV {
    func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        collectionView.anchor(
            .top(navigationBar.bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomButton.topAnchor, constant: 12)
        )
        
        bottomButton.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 12),
            .height(52)
        )
    }
}

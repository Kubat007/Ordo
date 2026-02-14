//
//  CollectProductListHeaderView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

import UIKit

final class CollectProductListHeaderView: UICollectionReusableView {
    static let identifier = "CollectProductListHeaderView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.bold18.font
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .centerY(centerYAnchor)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

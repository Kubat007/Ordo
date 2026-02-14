//
//  CollectProductListEmptyCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

import UIKit

final class CollectProductListEmptyCVCell: UICollectionViewCell {
    static let identifier = "CollectProductListEmptyCVCell"
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.regular16.font
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(messageLabel)
        messageLabel.anchor(
            .top(contentView.topAnchor, constant: 16),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with message: String) {
        messageLabel.text = message
    }
}

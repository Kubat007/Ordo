//
//  MainDetailCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

import UIKit

final class MainDetailCVCell: UICollectionViewCell {
    private let container = UIView()
    private lazy var priceLabel = makeLabel(font: Typography.bold16.font, background: .clear, color: .black)
    private lazy var titleLabel = makeLabel(font: Typography.regular14.font, background: .clear, color: .black)
    private lazy var descriptionLabel = makeLabel(font: Typography.regular14.font, background: .clear, color: .black)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        contentView.addSubview(container)
        container.addSubview(priceLabel)
        container.addSubview(titleLabel)
        container.addSubview(descriptionLabel)
        
        container.layer.cornerRadius = 16
        container.backgroundColor = .white
        
    }

    func configure(_ model: MainModels.Response.Products) {
        priceLabel.text = "\(model.price ?? 0) \(model.currency_name)"
        titleLabel.text = model.title
        descriptionLabel.text = model.text
    }
}

extension MainDetailCVCell {
    private func makeLabel(font: UIFont, background: UIColor, color: UIColor) -> UILabel {
        let l = UILabel()
        l.backgroundColor = background
        l.textColor = color
        l.numberOfLines = 0
        return l
    }
}

extension MainDetailCVCell {
    func setConstraints() {
        container.anchor(
            .top(contentView.topAnchor),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor)
        )

        priceLabel.anchor(
            .top(container.topAnchor, constant: 16),
            .leading(container.leadingAnchor, constant: 16)
        )

        titleLabel.anchor(
            .top(priceLabel.bottomAnchor, constant: 8),
            .leading(container.leadingAnchor, constant: 16),
            .trailing(container.trailingAnchor, constant: 16)
        )

        descriptionLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .leading(container.leadingAnchor, constant: 16),
            .trailing(container.trailingAnchor, constant: 16),
            .bottom(container.bottomAnchor, constant: 16)
        )
    }
}

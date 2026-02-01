//
//  MainDetailDescriptionCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 1/2/26.
//

import UIKit

final class MainDetailDescriptionCVCell: UICollectionViewCell {
    private lazy var productLabel = makeLabel(font: Typography.bold16.font, background: .green, color: .black)
    private lazy var priceLabel = makeLabel(font: Typography.bold16.font, background: .clear, color: .black)
    private lazy var titleLabel = makeLabel(font: Typography.regular14.font, background: .clear, color: .black)
    private lazy var descriptionLabel = makeLabel(font: Typography.regular14.font, background: .clear, color: .black)
    private lazy var showLabel = makeLabel(font: Typography.regular16.font, background: .clear, color: .black)
    private let downImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        addSubview(productLabel)
        addSubview(priceLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(showLabel)
        addSubview(downImage)
        
        downImage.clipsToBounds = true
        downImage.contentMode = .scaleAspectFill
    }

    func configure(_ model: MainModels.Response.Products, isExpanded: Bool) {
        productLabel.text = "Товар"
        showLabel.text = "Показать все"
        priceLabel.text = "\(model.price ?? 0) \(model.currency_name)"
        titleLabel.text = model.title
        descriptionLabel.text = model.text
        downImage.image = Asset.Images.Disclosure.disclosure_down.image
        
        UIView.animate(withDuration: 0.25) {
            self.downImage.transform = isExpanded ? CGAffineTransform(rotationAngle: .pi) : .identity
        }
    }
}

extension MainDetailDescriptionCVCell {
    private func makeLabel(font: UIFont, background: UIColor, color: UIColor) -> UILabel {
        let l = UILabel()
        l.backgroundColor = background
        l.textColor = color
        l.numberOfLines = 0
        return l
    }
}

extension MainDetailDescriptionCVCell {
    func setConstraints() {
        showLabel.anchor(
            .top(topAnchor, constant: 12),
            .leading(leadingAnchor, constant: 16)
//            .trailing(trailingAnchor, constant: 16)
        )
        
        productLabel.anchor(
            .top(showLabel.bottomAnchor, constant: 16),
            .leading(leadingAnchor, constant: 16)
        )

        priceLabel.anchor(
            .top(productLabel.bottomAnchor, constant: 22),
            .leading(leadingAnchor, constant: 16)
        )

        titleLabel.anchor(
            .top(priceLabel.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16)
        )

        descriptionLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(bottomAnchor, constant: 16)
        )
        
        downImage.anchor(
            .centerY(showLabel.centerYAnchor),
            .leading(showLabel.trailingAnchor, constant: 16),
            .height(20),
            .width(20)
        )
    }
}

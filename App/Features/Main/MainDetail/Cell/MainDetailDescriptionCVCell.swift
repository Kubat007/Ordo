//
//  MainDetailDescriptionCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 1/2/26.
//

import UIKit

final class MainDetailDescriptionCVCell: UICollectionViewCell {
    private lazy var productLabel = makeLabel(font: Typography.bold16.font)
    private lazy var priceLabel = makeLabel(font: Typography.bold18.font)
    private lazy var titleLabel = makeLabel(font: Typography.regular14.font)
    private lazy var descriptionLabel = makeLabel(font: Typography.regular14.font)
    private lazy var showLabel = makeLabel(font: Typography.bold16.font)
    private let downImage = UIImageView()
    
    private var constraintsInstalled = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private func setup() {
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(showLabel)
        contentView.addSubview(downImage)
        downImage.clipsToBounds = true
        showLabel.textColor = Asset.Colors._232837.color
        downImage.contentMode = .scaleAspectFill
        productLabel.backgroundColor = Asset.Colors._45B26B.color
        productLabel.clipsToBounds = true
        productLabel.layer.cornerRadius = 12
        
        showLabel.translatesAutoresizingMaskIntoConstraints = false
        downImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(_ model: MainModels.Response.Products, isExpanded: Bool) {
        productLabel.text = "  Товар  "
        productLabel.textColor = .white
        priceLabel.text = "\(model.price ?? 0) \(model.currency_name)"
        titleLabel.text = model.title
        descriptionLabel.text = model.text
        downImage.image = Asset.Images.Disclosure.disclosureDownColor.image
        
        if descriptionLabel.text == nil {
            descriptionLabel.text = ""
        }
        if isExpanded {
            descriptionLabel.numberOfLines = 0
            showLabel.text = "Скрыть"
        } else {
            descriptionLabel.numberOfLines = 3
            showLabel.text = "Показать все"
        }
        
        UIView.animate(withDuration: 0.25) {
            self.downImage.transform = isExpanded ? CGAffineTransform(rotationAngle: .pi) : .identity
        }
    }
}

extension MainDetailDescriptionCVCell {
    private func makeLabel(font: UIFont) -> UILabel {
        let l = UILabel()
        l.backgroundColor = .clear
        l.textColor = .black
        l.numberOfLines = 0
        l.font = font
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }
}

extension MainDetailDescriptionCVCell {
    func setConstraints() {
        guard !constraintsInstalled else { return }
        
        NSLayoutConstraint.activate([
            showLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            showLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            downImage.leadingAnchor.constraint(equalTo: showLabel.trailingAnchor, constant: 8),
            downImage.centerYAnchor.constraint(equalTo: showLabel.centerYAnchor),
            downImage.widthAnchor.constraint(equalToConstant: 12),
            downImage.heightAnchor.constraint(equalToConstant: 12),
            downImage.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            
            productLabel.topAnchor.constraint(equalTo: showLabel.bottomAnchor, constant: 12),
            productLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productLabel.heightAnchor.constraint(equalToConstant: 26),
            
            priceLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 12),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        constraintsInstalled = true
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: UIView.layoutFittingCompressedSize.height)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return layoutAttributes
    }
}


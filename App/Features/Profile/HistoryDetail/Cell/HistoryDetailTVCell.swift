//
//  HistoryDetailTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit

final class HistoryDetailTVCell: UITableViewCell {
    static let identifier = "HistoryDetailTVCell"
    private let containerView = UIView()
    private let productImage = UIImageView()

    private lazy var titleLabel = makeLabel(font: Typography.regular14.font)
    private lazy var priceLabel = makeLabel(font: Typography.semibold14.font)
    private lazy var countLabel = makeLabel(font: Typography.regular14.font)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func setup(model: CartModel.Response.OrderItems?) {
        titleLabel.text = model?.product_title
        priceLabel.text = "\(model?.unit_price ?? 0) KGS"
        countLabel.text = "\(model?.quantity ?? 1) шт."
        if let img = model?.product_image {
            productImage.kf.setImage(with: URL(string: img))
        }
    }
}

private extension HistoryDetailTVCell {

    func setup() {
        selectionStyle = .none
        backgroundColor = .clear

        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 16

        productImage.layer.cornerRadius = 12
        productImage.clipsToBounds = true
        productImage.contentMode = .scaleAspectFill
    }

    func setSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(productImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(countLabel)
    }

    func makeLabel(font: UIFont) -> UILabel {
        let l = UILabel()
        l.font = font
        l.textColor = .black
        l.numberOfLines = 2
        return l
    }
}

private extension HistoryDetailTVCell {

    func setConstraints() {

        containerView.anchor(
            .top(contentView.topAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 8)
        )

        productImage.anchor(
            .leading(containerView.leadingAnchor, constant: 12),
            .centerY(containerView.centerYAnchor),
            .width(64),
            .height(64)
        )

        titleLabel.anchor(
            .top(containerView.topAnchor, constant: 16),
            .leading(productImage.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        priceLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .leading(titleLabel.leadingAnchor)
        )

        countLabel.anchor(
            .centerY(priceLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
    }
}

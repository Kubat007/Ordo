//
//  FAQTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

final class FAQTVCell: UITableViewCell {
    static let identifier = "FAQTVCell"
    private let titleLabel = UILabel()
    private let arrowImageView = UIImageView()
    private let separator = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        backgroundColor = Asset.Colors.white.color
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        selectionStyle = .none
        titleLabel.font = Typography.semibold16.font
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        arrowImageView.image = UIImage(systemName: "chevron.right")
        arrowImageView.tintColor = .lightGray
        separator.backgroundColor = UIColor(white: 0.9, alpha: 1)
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(separator)
    }

    func configure(model: ProfileModel.Response.FAQModel) {
        titleLabel.text = model.question
    }

    private func setupConstraints() {
        titleLabel.anchor(
            .top(contentView.topAnchor, constant: 16),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(arrowImageView.leadingAnchor, constant: 12)
        )

        arrowImageView.anchor(
            .centerY(titleLabel.centerYAnchor),
            .trailing(contentView.trailingAnchor, constant: 16),
            .width(12),
            .height(16)
        )

        separator.anchor(
            .top(titleLabel.bottomAnchor, constant: 16),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .height(1),
            .bottom(contentView.bottomAnchor)
        )
    }
}

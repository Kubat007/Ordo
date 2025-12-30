//
//  NewsTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

import UIKit

final class NewsTVCell: UITableViewCell {

    static let identifier = "NewsTVCell"

    private let dateLabel = UILabel()
    private let titleLabel = UILabel()
    private let separator = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        selectionStyle = .none

        dateLabel.font = Typography.regular12.font
        dateLabel.textColor = .lightGray

        titleLabel.font = Typography.semibold16.font
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        separator.backgroundColor = UIColor(white: 0.9, alpha: 1)

        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)
    }

    func configure(with model: ProfileModel.Response.NewsModeL) {
        dateLabel.text = model.date
        titleLabel.text = model.title
    }

    private func setupConstraints() {
        dateLabel.anchor(
            .top(contentView.topAnchor, constant: 16),
            .leading(contentView.leadingAnchor, constant: 16)
        )

        titleLabel.anchor(
            .top(dateLabel.bottomAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16)
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

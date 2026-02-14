//
//  ProductListItemsTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 11/2/26.
//

import UIKit

final class ProductListItemsTVCell: UITableViewCell {
    static let identifier = "ProductListItemsTVCell"

    var onDelete: (() -> Void)?

    private let titleLabel = UILabel()
    private let deleteButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        selectionStyle = .none
        backgroundColor = Asset.Colors.f7F7Fe.color
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupUI() {
        titleLabel.font = Typography.regular16.font
        titleLabel.textColor = .black
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.tintColor = .red
        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        contentView.addSubview(titleLabel)
        contentView.addSubview(deleteButton)
    }

    func configure(text: String, index: Int) {
        titleLabel.text = "\(index + 1)) \(text)"
    }
    
    func configureDetail(model: ListModel.Response.DetailProductListItems, index: Int) {
        titleLabel.text = "\(index + 1)) \(model.term ?? "")"
    }

    @objc private func deleteTapped() {
        onDelete?()
    }

    private func setupConstraints() {
        titleLabel.anchor(
            .top(contentView.topAnchor, constant: 14),
            .leading(contentView.leadingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 14)
        )

        deleteButton.anchor(
            .centerY(titleLabel.centerYAnchor),
            .trailing(contentView.trailingAnchor, constant: 16),
            .width(24),
            .height(24)
        )
    }
}

//
//  MoreTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

import UIKit

final class MoreTVCell: UITableViewCell {
    static let identifier = "MoreCell"
    
    private lazy var containerView = makeContainerView()
    private lazy var productImageView = makeImageView()
    private lazy var titleLabel = makeLabel(font: Typography.semibold16.font)
    private lazy var priceLabel = makeLabel(font: Typography.semibold14.font)
    
    private lazy var minusButton = makeCounterButton(title: "–")
    private lazy var plusButton = makeCounterButton(title: "+")
    private lazy var countLabel = makeCountLabel()
    
    private lazy var deleteButton = makeDeleteButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: CartModel.Response.GetCartModel, itemIndex: Int) {
//        let isActive = model.is_active ?? false
//        let totalPrice = model.total_price ?? 0
        
        if let items = model.items, itemIndex < items.count {
            let item = items[itemIndex]
            titleLabel.text = item.product_title
            priceLabel.text = "\(item.product_price ?? 0)"
            productImageView.kf.setImage(with: URL(string: item.product_image ?? ""))
        }
    }
}

extension MoreTVCell {
    func setSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(minusButton)
        containerView.addSubview(countLabel)
        containerView.addSubview(plusButton)
        containerView.addSubview(deleteButton)
    }
}

extension MoreTVCell {
    private func makeContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = .zero
        return view
    }
    
    private func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.backgroundColor = .systemGray5
        return image
    }
    
    private func makeLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = Asset.Colors.black.color
        return label
    }
    
    private func makeCounterButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = Typography.semibold18.font
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }
    
    private func makeCountLabel() -> UILabel {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = Typography.semibold14.font
        return label
    }
    
    private func makeDeleteButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Удалить", for: .normal)
        button.backgroundColor = UIColor(red: 0.85, green: 0.20, blue: 0.35, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = Typography.semibold14.font
        return button
    }
}

extension MoreTVCell {
    private func setConstraints() {
        
        containerView.anchor(
            .top(contentView.topAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 8)
        )
        
        productImageView.anchor(
            .top(containerView.topAnchor, constant: 12),
            .leading(containerView.leadingAnchor, constant: 12),
            .width(80),
            .height(80)
        )
        
        titleLabel.anchor(
            .top(containerView.topAnchor, constant: 12),
            .leading(productImageView.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 12)
        )
        
        priceLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 4),
            .leading(titleLabel.leadingAnchor)
        )
        
        minusButton.anchor(
            .leading(titleLabel.leadingAnchor),
            .bottom(containerView.bottomAnchor, constant: 12),
            .width(36),
            .height(36)
        )
        
        countLabel.anchor(
            .leading(minusButton.trailingAnchor, constant: 8),
            .centerY(minusButton.centerYAnchor),
            .width(24)
        )
        
        plusButton.anchor(
            .leading(countLabel.trailingAnchor, constant: 8),
            .centerY(minusButton.centerYAnchor),
            .width(36),
            .height(36)
        )
        
        deleteButton.anchor(
            .trailing(containerView.trailingAnchor, constant: 12),
            .bottom(containerView.bottomAnchor, constant: 12),
            .width(96),
            .height(36)
        )
    }
}

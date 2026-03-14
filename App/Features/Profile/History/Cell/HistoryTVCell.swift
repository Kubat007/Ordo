//
//  HistoryTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit

final class HistoryTVCell: UITableViewCell {
    static let identifier = "HistoryTVCell"
    private let containerView = UIView()
    
    private lazy var orderNumberLabel = makeLabel(text: "Номер заказа", textColor: Asset.Colors._808191.color, font: Typography.regular14.font)
    private lazy var addressTitleLabel = makeLabel(text: "Адрес", textColor: Asset.Colors._808191.color, font: Typography.regular14.font)
    private lazy var dateTitleLabel = makeLabel(text: "Дата доставки", textColor: Asset.Colors._808191.color, font: Typography.regular14.font)
    private lazy var statusTitleLabel = makeLabel(text: "Статус заказа", textColor: Asset.Colors._808191.color, font: Typography.regular14.font)
    private lazy var priceTitleLabel = makeLabel(text: "Сумма заказа", textColor: Asset.Colors._808191.color, font: Typography.regular14.font)
    
    private lazy var orderLabel = makeLabel(text: "", textColor: .black, font: Typography.regular14.font)
    private lazy var addressLabel = makeLabel(text: "", textColor: .black, font: Typography.regular14.font)
    private lazy var dateLabel = makeLabel(text: "", textColor: .black, font: Typography.regular14.font)
    private lazy var statusLabel = makeLabel(text: "", textColor: .black, font: Typography.regular14.font)
    private lazy var priceLabel = makeLabel(text: "", textColor: .black, font: Typography.regular14.font)
    
    private let imagesStack = UIStackView()
    private let repeatButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setSubview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup(model: CartModel.Response.Order) {
        orderLabel.text = "#\(model.id ?? 0)"
        addressLabel.text = model.address
        dateLabel.text = model.delivery_date
        priceLabel.text = "\(model.total_amount ?? 0) c"
        statusLabel.text = model.status
        
        let productImages = model.items?.compactMap { $0.product_image } ?? []
        setupImages(productImages)
        statusLabel.textColor = model.status == "placed"
        ? UIColor.systemGreen
        : UIColor.systemOrange
    }
}

extension HistoryTVCell {
    func setSubview() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(orderNumberLabel)
        containerView.addSubview(addressTitleLabel)
        containerView.addSubview(dateTitleLabel)
        containerView.addSubview(statusTitleLabel)
        containerView.addSubview(priceTitleLabel)
        
        containerView.addSubview(orderLabel)
        containerView.addSubview(statusLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(priceLabel)
        
        containerView.addSubview(imagesStack)
        containerView.addSubview(repeatButton)
    }
}

private extension HistoryTVCell {
    func setup() {
        selectionStyle = .none
        backgroundColor = .clear
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 16
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 8
        containerView.layer.masksToBounds = false
        
        imagesStack.axis = .horizontal
        imagesStack.spacing = 8
        
        repeatButton.setTitle("Повторить заказ", for: .normal)
        repeatButton.backgroundColor = UIColor(red: 0.1, green: 0.16, blue: 0.47, alpha: 1)
        repeatButton.layer.cornerRadius = 12
        repeatButton.titleLabel?.font = Typography.semibold14.font
        repeatButton.setTitleColor(.white, for: .normal)
    }
}

extension HistoryTVCell {
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.text = text
        label.font = font
        return label
    }
}

private extension HistoryTVCell {
    func setupImages(_ urls: [String]) {
        imagesStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        urls.prefix(3).forEach { url in
            let image = UIImageView()
            image.layer.cornerRadius = 12
            image.clipsToBounds = true
            image.contentMode = .scaleAspectFill
            image.backgroundColor = .systemGray5
            image.widthAnchor.constraint(equalToConstant: 56).isActive = true
            image.heightAnchor.constraint(equalToConstant: 56).isActive = true
            image.kf.setImage(with: URL(string: url))
            imagesStack.addArrangedSubview(image)
        }
        
        if urls.count > 3 {
            let moreView = UILabel()
            moreView.text = "+\(urls.count - 3)"
            moreView.textAlignment = .center
            moreView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            moreView.textColor = .white
            moreView.layer.cornerRadius = 12
            moreView.clipsToBounds = true
            moreView.widthAnchor.constraint(equalToConstant: 56).isActive = true
            moreView.heightAnchor.constraint(equalToConstant: 56).isActive = true
            imagesStack.addArrangedSubview(moreView)
        }
    }
}

private extension HistoryTVCell {
    func setConstraints() {
        containerView.anchor(
            .top(contentView.topAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 8)
        )
        
        orderNumberLabel.anchor(
            .top(containerView.topAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16)
        )
        
        addressTitleLabel.anchor(
            .top(orderNumberLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16)
        )
        
        dateTitleLabel.anchor(
            .top(addressTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16)
        )
        
        statusTitleLabel.anchor(
            .top(dateTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16)
        )
        
        priceTitleLabel.anchor(
            .top(statusTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16)
        )
        
        orderLabel.anchor(
            .centerY(orderNumberLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
        
        addressLabel.anchor(
            .centerY(addressTitleLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
        
        dateLabel.anchor(
            .centerY(dateTitleLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
        
        statusLabel.anchor(
            .centerY(statusTitleLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
        
        priceLabel.anchor(
            .centerY(priceTitleLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
        
        imagesStack.anchor(
            .top(priceTitleLabel.bottomAnchor, constant: 12),
            .centerX(containerView.centerXAnchor)
        )
        
        repeatButton.anchor(
            .top(imagesStack.bottomAnchor, constant: 16),
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16),
            .height(44),
            .bottom(containerView.bottomAnchor, constant: 16)
        )
    }
}

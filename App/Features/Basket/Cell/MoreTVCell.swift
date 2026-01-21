//
//  MoreTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

import UIKit

protocol MoreTVCellDelegate: AnyObject {
    func deleteButtonTappet(model: CartModel.Response.Items)
    func plusButtonTappet(cell: MoreTVCell)
    func minusButtonTappet(cell: MoreTVCell)
}

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
    weak var delegate: MoreTVCellDelegate?
    var model: CartModel.Response.Items?
    
    private var currentCount: Int = 0 {
        didSet {
            countLabel.text = "\(currentCount)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        setupButtons()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: CartModel.Response.GetCartModel, itemIndex: Int) {
        if let items = model.items, itemIndex < items.count {
            let item = items[itemIndex]
            self.model = item
            titleLabel.text = item.product_title
            priceLabel.text = "\(item.product_price ?? 0)"
            productImageView.kf.setImage(with: URL(string: item.product_image ?? ""))
            
            countLabel.text = "\(item.quantity ?? 0)"
            currentCount = item.quantity ?? 0
        }
        countLabel.textColor = .black
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
    
    func setupButtons() {
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonAction), for: .touchUpInside)
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 8
        containerView.layer.masksToBounds = false
    }
}

@objc extension MoreTVCell {
    func deleteButtonAction() {
        guard let model = self.model else { return }
        delegate?.deleteButtonTappet(model: model)
    }
    
    func plusButtonAction() {
        currentCount += 1
        delegate?.plusButtonTappet(cell: self)
    }
    
    func minusButtonAction() {
        guard currentCount > 1 else { return }
        currentCount -= 1
        delegate?.minusButtonTappet(cell: self)
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
        button.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
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

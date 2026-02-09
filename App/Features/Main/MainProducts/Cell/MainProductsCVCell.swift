//
//  MainProductsCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 9/2/26.
//

import UIKit

protocol MainProductsCVCellDelegate: AnyObject {
    func basketTapped(cell: MainProductsCVCell, model: MainModels.Response.Products?)
    func favTapped(cell: MainProductsCVCell, productId: Int)
}

final class MainProductsCVCell: UICollectionViewCell {
    lazy var container = makeContainer()
    lazy var logoView = makeImageView()
    lazy var titleLabel = makeLabel(font: Typography.regular14.font)
    lazy var priceLabel = makeLabel(font: Typography.bold16.font)
    lazy var favButton = makeButton(color: .clear, radius: 0)
    lazy var basketButton = makeButton(color: UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00), radius: 14)
    
    weak var delegate: MainProductsCVCellDelegate?
    var productId: Int = 0
    var model: MainModels.Response.Products?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setSubviews() {
        contentView.addSubview(container)
        container.addSubview(logoView)
        container.addSubview(titleLabel)
        container.addSubview(priceLabel)
        container.addSubview(favButton)
        container.addSubview(basketButton)
    }
    
    func setupAppearance() {
        favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favButton.tintColor = .gray
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        basketButton.addTarget(self, action: #selector(basketButtonTapped), for: .touchUpInside)
        basketButton.setImage(UIImage(named: "Images/basket_ic"), for: .normal)
    }
    
    func configure(_ model: MainModels.Response.Products) {
        productId = model.id
        self.model = model
        titleLabel.text = model.title
        priceLabel.text = "\(model.price ?? 0) \(model.currency_name)"
        
        if let url = URL(string: model.images_gallery.first?.image ?? "") {
            logoView.kf.setImage(with: url)
        }
    }
}

@objc
extension MainProductsCVCell {
    @objc func basketButtonTapped() {
        delegate?.basketTapped(cell: self, model: model)
    }
    
    @objc func favButtonTapped() {
        if favButton.tintColor == .red {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favButton.tintColor = .gray
        } else {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favButton.tintColor = .red
        }
        delegate?.favTapped(cell: self, productId: productId)
    }
}

extension MainProductsCVCell {
    func makeLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = font
        label.textAlignment = .left
        return label
    }
    
    private func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        //        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }
    
    func makeContainer() -> UIView {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 12
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.1
        v.layer.shadowRadius = 8
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        return v
    }
    
    func makeButton(color: UIColor, radius: Double) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.layer.cornerRadius = radius
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return button
    }
}

extension MainProductsCVCell {
    func setConstraints() {
        container.anchor(
            .top(contentView.topAnchor),
            .leading(contentView.leadingAnchor),
            .trailing(contentView.trailingAnchor),
            .bottom(contentView.bottomAnchor)
        )
        
        logoView.anchor(
            .top(container.topAnchor, constant: 12),
            .leading(container.leadingAnchor, constant: 12),
            .trailing(container.trailingAnchor, constant: 12),
            .height(120)
        )
        
        priceLabel.anchor(
            .top(logoView.bottomAnchor, constant: 2),
            .leading(container.leadingAnchor, constant: 12)
        )
        
        titleLabel.anchor(
            .top(priceLabel.bottomAnchor, constant: 8),
            .leading(container.leadingAnchor, constant: 12),
            .trailing(container.trailingAnchor, constant: 12),
            .bottom(container.bottomAnchor, constant: 8)
        )
        
        favButton.anchor(
            .top(logoView.topAnchor, constant: 8),
            .trailing(container.trailingAnchor, constant: 8),
            .height(32),
            .width(32)
        )
        
        basketButton.anchor(
            .top(logoView.bottomAnchor, constant: -16),
            .trailing(container.trailingAnchor, constant: 16),
            .height(28),
            .width(28)
        )
    }
}

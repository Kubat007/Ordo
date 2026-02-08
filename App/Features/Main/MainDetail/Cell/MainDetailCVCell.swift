//
//  MainDetailCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

import UIKit

protocol MainDetailCVCellDelegate: AnyObject {
    func basketTapped(cell: MainDetailCVCell, model: MainModels.Response.Products?)
    func favTapped(cell: MainDetailCVCell, productId: Int)
}

final class MainDetailCVCell: UICollectionViewCell {
    private let container = UIView()
    lazy var logoView = makeImageView()
    lazy var favButton = makeButton(color: .clear, radius: 0)
    private lazy var priceLabel = makeLabel(font: Typography.bold18.font, background: .clear, color: .black)
    private lazy var titleLabel = makeLabel(font: Typography.regular12.font, background: .clear, color: .black)
    lazy var basketButton = makeButton(color: UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00), radius: 16)
    
    var productId: Int = 0
    weak var delegate: MainDetailCVCellDelegate?
    var model: MainModels.Response.Products?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
        setButtons()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        contentView.addSubview(container)
        addSubview(logoView)
        addSubview(priceLabel)
        addSubview(titleLabel)
        addSubview(favButton)
        addSubview(basketButton)
//        container.addSubview(descriptionLabel)
        
        container.layer.cornerRadius = 16
        container.backgroundColor = .white
        
    }

    func configure(_ model: MainModels.Response.Products) {
        productId = model.id
        self.model = model
        priceLabel.text = "\(model.price ?? 0) \(model.currency_name)"
        titleLabel.text = model.title
        if let firstImage = model.images_gallery.first,
           let imageUrl = URL(string: firstImage.image) {
            logoView.kf.setImage(with: imageUrl)
        } else {
            logoView.image = nil
        }
    }
}

extension MainDetailCVCell {
    func setButtons() {
        favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favButton.tintColor = .gray
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        basketButton.setImage(UIImage(named: "Images/basket_ic"), for: .normal)
        basketButton.addTarget(self, action: #selector(basketButtonTapped), for: .touchUpInside)
    }
    
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

extension MainDetailCVCell {
    private func makeLabel(font: UIFont, background: UIColor, color: UIColor) -> UILabel {
        let l = UILabel()
        l.backgroundColor = background
        l.adjustsFontSizeToFitWidth = true
        l.textColor = color
        l.font = font
        l.numberOfLines = 3
        return l
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 14
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
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

extension MainDetailCVCell {
    func setConstraints() {
        container.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .bottom(bottomAnchor, constant: 16),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        logoView.anchor(
            .top(container.topAnchor),
            .trailing(container.trailingAnchor),
            .leading(container.leadingAnchor),
            .bottom(container.bottomAnchor, constant: 82)
        )
        
        priceLabel.anchor(
            .top(logoView.bottomAnchor, constant: 4),
            .trailing(container.trailingAnchor, constant: 16),
            .leading(container.leadingAnchor, constant: 16)
        )
        
        titleLabel.anchor(
            .top(priceLabel.bottomAnchor, constant: 4),
            .trailing(container.trailingAnchor, constant: 16),
            .leading(container.leadingAnchor, constant: 16)
        )
        
        favButton.anchor(
            .top(logoView.topAnchor, constant: 8),
            .trailing(logoView.trailingAnchor, constant: 8),
            .height(32),
            .width(32)
        )
        
        basketButton.anchor(
            .top(logoView.bottomAnchor, constant: -16),
            .trailing(container.trailingAnchor, constant: 16),
            .height(32),
            .width(32)
        )
    }
}

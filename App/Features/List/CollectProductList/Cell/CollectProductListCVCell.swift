//
//  CollectProductListCVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

import UIKit

protocol CollectProductListCVCellDelegate: AnyObject {
    func basketAction(cell: CollectProductListCVCell, model: ListModel.Response.GetCollectProductItems?)
    func favAction(cell: CollectProductListCVCell, productId: Int)
}

final class CollectProductListCVCell: UICollectionViewCell {
    static let identifier = "CollectProductListCVCell"
    weak var delegate: CollectProductListCVCellDelegate?
    var model: ListModel.Response.GetCollectProductItems?
    var productId: Int = 0
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        return iv
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.tintColor = .red
        button.addTarget(self, action: #selector(favTappet), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.regular14.font
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.bold16.font
        label.textColor = .black
        return label
    }()
    
    private let basketButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00)
        button.layer.cornerRadius = 14
        button.setTitle("В корзину", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Typography.semibold14.font
        button.addTarget(self, action: #selector(basketTappet), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(favoriteButton)
        containerView.addSubview(priceLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(basketButton)
    }
    
    func configure(with product: ListModel.Response.GetCollectProductItems) {
        self.model = product
        productId = product.id ?? 0
        titleLabel.text = product.title
        if let price = product.price {
            let currency = product.currency_name ?? "KGS"
            priceLabel.text = "\(price) \(currency)"
        }
        if let imageUrl = product.images_gallery.first?.image {
            imageView.kf.setImage(with: URL(string: imageUrl))
        }
        favoriteButton.isSelected = product.is_favorite ?? false
    }
    
    @objc func basketTappet() {
        delegate?.basketAction(cell: self, model: self.model)
    }
    
    @objc func favTappet() {
        delegate?.favAction(cell: self, productId: self.productId)
    }
    
    private func setupConstraints() {
        containerView.anchor(
            .top(contentView.topAnchor),
            .leading(contentView.leadingAnchor),
            .trailing(contentView.trailingAnchor),
            .bottom(contentView.bottomAnchor)
        )
        
        imageView.anchor(
            .top(containerView.topAnchor, constant: 12),
            .leading(containerView.leadingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 12),
            .height(160)
        )
        
        favoriteButton.anchor(
            .top(imageView.topAnchor, constant: 8),
            .trailing(imageView.trailingAnchor, constant: 8),
            .width(32),
            .height(32)
        )
        
        priceLabel.anchor(
            .top(imageView.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 12)
        )
        
        titleLabel.anchor(
            .top(priceLabel.bottomAnchor, constant: 4),
            .leading(containerView.leadingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 12)
        )
        
        basketButton.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 12),
            .bottom(containerView.bottomAnchor, constant: 12),
            .height(36)
        )
    }
}

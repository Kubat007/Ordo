import UIKit
import Foundation
import Kingfisher

protocol ProductCellDelegate: AnyObject {
    func basketTapped(cell: ProductCell, model: MainModels.Response.Products?)
    func favTapped(cell: ProductCell, productId: Int, shouldAdd: Bool, favId: Int)
}

final class ProductCell: UICollectionViewCell {
    lazy var container = makeContentView()
    lazy var logoView = makeImageView()
    lazy var priceLabel = makeLabel(font: Typography.bold16.font)
    lazy var titleLabel = makeLabel(font: Typography.regular14.font)
    lazy var favButton = makeButton(color: .clear, radius: 0)
    lazy var basketButton = makeButton(color: UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00), radius: 14)
    
    var productId: Int = 0
    var favId: Int = 0
    var model: MainModels.Response.Products?
    weak var delegate: ProductCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoView.image = nil
        titleLabel.text = nil
        priceLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with productList: MainModels.Response.Products) {
        productId = productList.id
        favId = productList.favorite_id ?? 0
        model = productList
        if let firstImage = productList.images_gallery.first,
           let imageUrl = URL(string: firstImage.image) {
            logoView.kf.setImage(with: imageUrl)
        }
        titleLabel.text = productList.title
        priceLabel.text = "\(productList.price ?? 0) \(productList.currency_name)"
        updateFavoriteButton(isFavorite: productList.is_favorite ?? false)
    }
    
    func updateFavoriteButton(isFavorite: Bool) {
        if isFavorite {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favButton.tintColor = .red
        } else {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favButton.tintColor = .gray
        }
    }
}

extension ProductCell: BaseCV {
    public func setSubviews() {
        addSubview(container)
        addSubview(logoView)
        addSubview(priceLabel)
        addSubview(titleLabel)
        addSubview(favButton)
        addSubview(basketButton)
    }
    
    @objc func basketButtonTapped() {
        delegate?.basketTapped(cell: self, model: model)
    }
    
    @objc func favButtonTapped() {
        guard let isFavorite = model?.is_favorite else { return }
        updateFavoriteButton(isFavorite: !isFavorite)
        delegate?.favTapped(cell: self, productId: productId, shouldAdd: !isFavorite, favId: favId)
    }
}

extension ProductCell {
    private func setupUI() {
            favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
            basketButton.addTarget(self, action: #selector(basketButtonTapped), for: .touchUpInside)
            basketButton.setImage(UIImage(named: "Images/basket_ic"), for: .normal)
            container.layer.shadowColor = UIColor.black.cgColor
            container.layer.shadowOpacity = 0.4
            container.layer.shadowOffset = CGSize(width: 0, height: 4)
            container.layer.shadowRadius = 8
            container.layer.masksToBounds = false
        }
}

private extension ProductCell {
    private func makeContentView() -> UIView {
        let view = UIView()
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 14
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }
    
    func makeLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = font
        return label
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

extension ProductCell {
    public func setConstraints() {
        container.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .bottom(bottomAnchor),
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
            .height(28),
            .width(28)
        )
    }
}

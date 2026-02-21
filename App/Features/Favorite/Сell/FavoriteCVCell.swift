import UIKit
import Foundation

protocol FavoriteCVCellDelegate: AnyObject {
    func basketTapped(cell: FavoriteCVCell)
    func favTapped(cell: FavoriteCVCell, id: Int, productId: Int)
}

final class FavoriteCVCell: UICollectionViewCell {
    lazy var container = makeContentView()
    lazy var logoView = makeImageView()
    lazy var titleLabel = makeLabel()
    private lazy var basketButton = makeButton(image: "Images/basket_ic", action: #selector(basketButtonTapped), color: UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00), radius: 12.5)
    lazy var favButton = makeButton(image: "heart.fill", action: #selector(favButtonTapped), color: .clear, radius: 0)
    weak var delegate: FavoriteCVCellDelegate?
    var productId: Int = 0
    var id: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        favButton.tintColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
       
    }
    
    func setup(with productList: MainModels.Response.GetFavorites) {
        logoView.kf.setImage(with: URL(string: productList.product_images ?? ""))
        titleLabel.text = productList.product_title
        productId = productList.product_id ?? 0
        id = productList.id ?? 0
    }
    
}

extension FavoriteCVCell: BaseCV {
    public func setSubviews() {
        addSubview(container)
        container.addSubview(logoView)
        container.addSubview(titleLabel)
        container.addSubview(basketButton)
        container.addSubview(favButton)
        
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.2
        container.layer.shadowOffset = CGSize(width: 0, height: 4)
        container.layer.shadowRadius = 8
        container.layer.masksToBounds = false
    }
    
    @objc func basketButtonTapped() {
        delegate?.basketTapped(cell: self)
    }
    
    @objc func favButtonTapped() {
        delegate?.favTapped(cell: self, id: id, productId: productId)
    }
}

private extension FavoriteCVCell {
    private func makeContentView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 14
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = Typography.regular14.font
        return label
    }
    
    func makeButton(image: String, action: Selector, color: UIColor, radius: CGFloat) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = radius
        button.setImage(UIImage(named: image), for: .normal)
        button.backgroundColor = color
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
}

extension FavoriteCVCell {
    public func setConstraints() {
        container.fillSuperview()
        
        logoView.anchor(
            .top(container.topAnchor),
            .trailing(container.trailingAnchor),
            .leading(container.leadingAnchor),
            .height(150)
//            .bottom(container.bottomAnchor, constant: 40)
        )
        
        titleLabel.anchor(
            .top(logoView.bottomAnchor, constant: 4),
            .trailing(container.trailingAnchor, constant: 16),
            .leading(container.leadingAnchor, constant: 16),
            .bottom(container.bottomAnchor)
        )
        
        basketButton.anchor(
            .top(logoView.bottomAnchor, constant: -16),
            .trailing(container.trailingAnchor, constant: 16),
            .height(25),
            .width(25)
        )
        
        favButton.anchor(
            .top(logoView.topAnchor, constant: 8),
            .trailing(container.trailingAnchor, constant: 16),
            .height(32),
            .width(32)
        )
    }
}

import UIKit
import Foundation

protocol FavoriteCVCellDelegate: AnyObject {
    func basketTapped(cell: ProductCell)
}

final class FavoriteCVCell: UICollectionViewCell {
    lazy var container = makeContentView()
    lazy var logoView = makeImageView()
    lazy var titleLabel = makeLabel()
    private lazy var basketButton = makeButton()
    
    weak var delegate: ProductCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
       
    }
    
//    func setup(with productList: MainModels.Response.Products) {
//        titleLabel.text = productList.title
//    }
    
}

extension FavoriteCVCell: BaseCV {
    public func setSubviews() {
        addSubview(container)
        addSubview(logoView)
        addSubview(titleLabel)
        addSubview(basketButton)
    }
    
    @objc func basketButtonTapped() {
//        delegate?.basketTapped(cell: self)
    }
}

private extension FavoriteCVCell {
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
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = Typography.regular14.font
        return label
    }
    
    func makeButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12.5
        button.setImage(UIImage(named: "Images/basket_ic"), for: .normal)
        button.backgroundColor = UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.addTarget(self, action: #selector(basketButtonTapped), for: .touchUpInside)
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
            .bottom(container.bottomAnchor, constant: 32)
        )
        
        titleLabel.anchor(
            .top(logoView.bottomAnchor, constant: 4),
            .trailing(container.trailingAnchor, constant: 16),
            .leading(container.leadingAnchor, constant: 16)
        )
        
        basketButton.anchor(
            .top(logoView.bottomAnchor, constant: -16),
            .trailing(container.trailingAnchor, constant: 16),
            .height(25),
            .width(25)
        )
    }
}

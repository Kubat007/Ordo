import UIKit

final class CategoryCell: UICollectionViewCell {
    lazy var container = makeContentView(color: .white)
    lazy var container2 = makeContentView(color: .white)
    lazy var logoView = makeImageView()
    lazy var titleLabel = makeLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: MainModels.Response.Category) {
        titleLabel.text = category.name
        if let iconUrl = category.icon, let url = URL(string: iconUrl) {
            logoView.kf.setImage(with: url)
        }
    }
    
    func setSubviews() {
        contentView.addSubview(container2)
        contentView.addSubview(container)
        container.addSubview(logoView)
        container2.addSubview(titleLabel)
    }
}

private extension CategoryCell {
    private func setupAppearance() {
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.layer.masksToBounds = true
        
        container.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 12
        container.layer.masksToBounds = false
        
        container2.backgroundColor = .white
        container2.layer.cornerRadius = 10
        container2.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        container2.layer.masksToBounds = true
        
        container2.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        container2.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container2.layer.shadowRadius = 15
        container2.layer.masksToBounds = false
        
        backgroundColor = .clear
    }
    
    private func makeContentView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 0
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        return label
    }
}

extension CategoryCell {
    func setConstraints() {
        container.anchor(
            .top(topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .height(90)
        )
        
        container2.anchor(
            .top(container.bottomAnchor, constant: -8),
            .leading(container.leadingAnchor),
            .trailing(container.trailingAnchor),
            .bottom(container.bottomAnchor, constant: -30)
        )
        
        logoView.anchor(
            .top(container.topAnchor, constant: 8),
            .centerX(container.centerXAnchor),
            .width(80),
            .height(80)
        )
        
        titleLabel.anchor(
            .top(container2.topAnchor, constant: 16),
            .leading(container2.leadingAnchor, constant: 4),
            .trailing(container2.trailingAnchor, constant: 4),
            .bottom(container2.bottomAnchor, constant: 8)
        )
    }
}

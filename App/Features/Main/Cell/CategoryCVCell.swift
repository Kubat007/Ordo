import UIKit

final class CategoryCell: UICollectionViewCell {
    lazy var container = makeContentView()
    lazy var logoView = makeImageView()
    lazy var titleLabel = makeLabel()
    
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
    
    func configure(with category: MainModels.Response.Category) {
        titleLabel.text = category.name
        logoView.kf.setImage(with: URL(string: category.icon ?? ""))
    }
    
}

extension CategoryCell: BaseCV {
    public func setSubviews() {
        addSubview(container)
        addSubview(logoView)
        addSubview(titleLabel)
    }
}

private extension CategoryCell {
    private func makeContentView() -> UIView {
        let view = UIView()
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 18
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.black
        label.font = Typography.bold12.font
        return label
    }
}

extension CategoryCell {
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
        
//        contentView.layer.cornerRadius = 8
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//        contentView.backgroundColor = .purple
    }
}

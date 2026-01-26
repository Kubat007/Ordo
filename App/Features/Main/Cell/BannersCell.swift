import UIKit
import Foundation
import Kingfisher

final class BannersCell: UICollectionViewCell {
    lazy var container = makeContainerView()
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
    
    func configure(with bannerList: MainModels.Response.Banner) {
//        titleLabel.text = bannerList.title
        logoView.kf.setImage(with: URL(string: bannerList.image ?? ""))
    }
}

extension BannersCell: BaseCV {
    public func setSubviews() {
        addSubview(container)
        container.addSubview(logoView)
        container.addSubview(titleLabel)
        
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.2
        container.layer.shadowOffset = CGSize(width: 0, height: 4)
        container.layer.shadowRadius = 8
        container.layer.masksToBounds = false
    }
}

private extension BannersCell {
    private func makeContainerView() -> UIView {
        let view = UIView()
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 18
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }
}

extension BannersCell {
    public func setConstraints() {
        container.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .bottom(bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        logoView.anchor(
            .top(container.topAnchor),
            .bottom(container.bottomAnchor, constant: 32),
            .leading(container.leadingAnchor),
            .trailing(container.trailingAnchor)
        )
        
        titleLabel.anchor(
            .centerY(centerYAnchor),
            .trailing(trailingAnchor, constant: 16),
            .leading(leadingAnchor, constant: 12)
        )
    }
}

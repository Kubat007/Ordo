//
//  TVHeader.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 3/1/26.
//

import Foundation
import UIKit

public final class TitleSectionHeaderView: UITableViewHeaderFooterView {
    lazy var mainView = makeView()
    lazy var icon = makeNameImage()
    lazy var titleLabel = makeTitleLabel()
    
    private let viewsLeadingTrailing: CGFloat = 16 * Constants.ScreenSizeConstant
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWith(icon: UIImage?, title: String) {
        self.icon.image = icon
        titleLabel.text = title
    }
    
    func setupFilterHeader(title: String) {
        titleLabel.text = title
        mainView.backgroundColor = Asset.Colors.f7F7Fe.color
    }
}

extension TitleSectionHeaderView: BaseCV {
    public func setSubviews() {
        addSubview(mainView)
        mainView.addSubview(icon)
        mainView.addSubview(titleLabel)
    }
    
    func setProperties() {
        backgroundColor = Asset.Colors.f7F7Fe.color
    }
}

private extension TitleSectionHeaderView {
    func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = Asset.Colors.white.color
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = Typography.medium14.font
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }
    
    func makeNameImage() -> UIImageView {
        let view = UIImageView()
        return view
    }
}

extension TitleSectionHeaderView {
    public func setConstraints() {
        mainView.fillSuperview()
        
        icon.anchor(
            .leading(mainView.leadingAnchor, constant: viewsLeadingTrailing),
            .centerY(mainView.centerYAnchor),
            .width(20),
            .height(20)
        )
        
        titleLabel.anchor(
            .leading(icon.trailingAnchor, constant: 8),
            .trailing(mainView.trailingAnchor, constant: viewsLeadingTrailing),
            .top(mainView.topAnchor),
            .bottom(mainView.bottomAnchor)
        )
    }
}

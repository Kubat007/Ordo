//
//  TVHeader.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 3/1/26.
//

import Foundation
import UIKit

public final class TitleSectionHeaderView: UITableViewHeaderFooterView {
    private lazy var stackView = UIStackView()
    lazy var icon = makeNameImage()
    lazy var titleLabel = makeTitleLabel()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        backgroundColor = Asset.Colors.f7F7Fe.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWith(icon: UIImage?, title: String) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        if let icon = icon {
            self.icon.image = icon
            stackView.addArrangedSubview(self.icon)
            self.icon.anchor(.width(20), .height(20))
        }
        stackView.addArrangedSubview(titleLabel)
        titleLabel.text = title
        let spacer = UIView()
        stackView.addArrangedSubview(spacer)
    }
    
    func setupFilterHeader(title: String) {
        titleLabel.text = title
        backgroundColor = Asset.Colors.f7F7Fe.color
    }
}

extension TitleSectionHeaderView {
    private func setSubviews() {
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        
        contentView.addSubview(stackView)
    }
    
    private func setConstraints() {
        stackView.anchor(
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .top(contentView.topAnchor),
            .bottom(contentView.bottomAnchor)
        )
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = Typography.medium14.font
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }
    
    private func makeNameImage() -> UIImageView {
        let view = UIImageView()
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }
}

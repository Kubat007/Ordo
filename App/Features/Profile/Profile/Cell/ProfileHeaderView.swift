//
//  ProfileHeaderView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 24/12/25.
//

import UIKit

public final class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView = makeAvatarImageView()
    private lazy var nameLabel = makeLabel(text: "Elbrus", textColor: Asset.Colors.black.color, font: Typography.semibold17.font)
    private lazy var dateLabel = makeLabel(text: "С нами с 2025-07-30", textColor: .gray, font: Typography.regular14.font)
    private lazy var phoneLabel = makeLabel(text: "+996705073377", textColor: Asset.Colors.black.color, font: Typography.semibold14.font)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileHeaderView: BaseCV {
    public func setSubviews() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(phoneLabel)
    }
}

extension ProfileHeaderView {
    
    private func makeAvatarImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .white
        imageView.backgroundColor = UIColor.systemGray3
        imageView.layer.cornerRadius = 36
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        return label
    }
}

extension ProfileHeaderView {
    public func setConstraints() {
        
        avatarImageView.anchor(
            .top(topAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16),
            .width(72),
            .height(72)
        )
        
        nameLabel.anchor(
            .top(avatarImageView.topAnchor),
            .leading(avatarImageView.trailingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16)
        )
        
        dateLabel.anchor(
            .top(nameLabel.bottomAnchor, constant: 4),
            .leading(nameLabel.leadingAnchor)
        )
        
        phoneLabel.anchor(
            .top(dateLabel.bottomAnchor, constant: 8),
            .leading(nameLabel.leadingAnchor)
        )
    }
}

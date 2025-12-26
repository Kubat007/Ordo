//
//  ShowLoginView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 24/12/25.
//

import UIKit

 class ShowLoginView: UIView {
    private lazy var avatarImageView = makeAvatarImageView()
    private lazy var titleLabel = makeLabel(text: "Войдите или зарегистрируйтесь", textColor: .black, font: Typography.regular14.font)
    private lazy var subtitleLabel = makeLabel(text: "Добавляйте объявления в избранное, чтобы посмотреть их позже", textColor: .systemGray, font: Typography.regular14.font)
    lazy var authButton = makeAuthButton()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        if AuthManager.shared.isLoggedIn {
            print("Токе есть")
        } else {
            print("Токе нет")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShowLoginView: BaseCV {
    public func setSubviews() {
        addSubview(avatarImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(authButton)
    }
}

extension ShowLoginView {
    private func makeAvatarImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(
            systemName: "person.crop.circle.fill"
        )?.withTintColor(
            UIColor.systemGray3,
            renderingMode: .alwaysOriginal
        )
        return imageView
    }
    
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = textColor
        label.font = font
        label.text = text
        return label
    }
    
    private func makeAuthButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("ВОЙТИ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Asset.Colors.fe1D00.color
        button.titleLabel?.font = Typography.bold14.font
        button.layer.cornerRadius = 10
        return button
    }
}

extension ShowLoginView {
    public func setConstraints() {
        avatarImageView.anchor(
            .top(safeAreaLayoutGuide.topAnchor, constant: 80),
            .centerX(centerXAnchor),
            .width(120),
            .height(120)
        )
        
        titleLabel.anchor(
            .top(avatarImageView.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 12),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        authButton.anchor(
            .top(subtitleLabel.bottomAnchor, constant: 32),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32),
            .height(48)
        )
    }
}

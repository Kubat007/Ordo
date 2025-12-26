//
//  ProfileCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

public final class ProfileCV: UIView {
    lazy var loginViewBigContainer = makeView()
    private lazy var avatarImageView = makeAvatarImageView()
    private lazy var titleLabel = makeLabel(text: "Войдите или зарегистрируйтесь", textColor: .black, font: Typography.bold18.font)
    private lazy var subtitleLabel = makeLabel(text: "Добавляйте объявления в избранное, чтобы посмотреть их позже", textColor: .systemGray, font: Typography.regular14.font)
    lazy var authButton = makeAuthButton()
    
    lazy var tableView = makeTableView()
    let headerView = ProfileHeaderView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTable() {
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.backgroundColor = .clear
        
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120)
        tableView.tableHeaderView = headerView
    }
}

extension ProfileCV: BaseCV {
    public func setSubviews() {
        addSubview(loginViewBigContainer)
        loginViewBigContainer.addSubview(avatarImageView)
        loginViewBigContainer.addSubview(titleLabel)
        loginViewBigContainer.addSubview(subtitleLabel)
        loginViewBigContainer.addSubview(authButton)
        addSubview(tableView)
    }
}

extension ProfileCV {
    private func makeView() -> UIView {
        let view = UIView()
        return view
    }
    
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
    
    func makeTableView() -> UITableView {
        let table = UITableView()
        table.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        table.backgroundColor = .clear
        table.separatorStyle = .singleLine
        table.rowHeight = 80
        table.showsVerticalScrollIndicator = false
        table.isHidden = true
        return table
    }
}

extension ProfileCV {
    public func setConstraints() {
        loginViewBigContainer.fillSuperview()
        
        avatarImageView.anchor(
            .top(loginViewBigContainer.safeAreaLayoutGuide.topAnchor, constant: 80),
            .centerX(loginViewBigContainer.centerXAnchor),
            .width(120),
            .height(120)
        )
        
        titleLabel.anchor(
            .top(avatarImageView.bottomAnchor, constant: 24),
            .leading(loginViewBigContainer.leadingAnchor, constant: 32),
            .trailing(loginViewBigContainer.trailingAnchor, constant: 32)
        )
        
        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 12),
            .leading(loginViewBigContainer.leadingAnchor, constant: 32),
            .trailing(loginViewBigContainer.trailingAnchor, constant: 32)
        )
        
        authButton.anchor(
            .top(subtitleLabel.bottomAnchor, constant: 32),
            .leading(loginViewBigContainer.leadingAnchor, constant: 32),
            .trailing(loginViewBigContainer.trailingAnchor, constant: 32),
            .height(48)
        )
        
        tableView.fillSuperview()
    }
}

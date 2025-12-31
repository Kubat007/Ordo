//
//  ProfileCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 24/12/25.
//

import UIKit

final class ProfileCell: UITableViewCell {
    static let identifier = "ProfileCell"
    private lazy var titleLabel = makeLabel(textColor: Asset.Colors.black.color, font: Typography.semibold16.font)
    private lazy var subtitleLabel = makeLabel(textColor: .gray, font: Typography.regular14.font)
    private lazy var arrowImageView = makeArrowImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: SettingsSectionCellData) {
        titleLabel.text = model.title
        subtitleLabel.text = model.desc
    }
}

extension ProfileCell {
    func setSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(arrowImageView)
    }
}

extension ProfileCell {
    private func makeLabel(textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        label.numberOfLines = 1
        return label
    }
    
    private func makeArrowImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .lightGray
        return imageView
    }
}

extension ProfileCell {
    private func setConstraints() {
        
        titleLabel.anchor(
            .top(contentView.topAnchor, constant: 12),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(arrowImageView.leadingAnchor, constant: 8)
        )
        
        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 4),
            .leading(titleLabel.leadingAnchor),
            .trailing(titleLabel.trailingAnchor),
            .bottom(contentView.bottomAnchor, constant: 12)
        )
        
        arrowImageView.anchor(
            .centerY(contentView.centerYAnchor),
            .trailing(contentView.trailingAnchor, constant: 16),
            .width(12),
            .height(16)
        )
    }
}

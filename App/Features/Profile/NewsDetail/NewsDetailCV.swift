//
//  NewsDetailCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

public final class NewsDetailCV: UIView {
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    lazy var backButton = makeButton()
    private lazy var imageView = makeImageView()
    private lazy var containerView = makeContainerView()
    
    private lazy var dateLabel = makeLabel(font: Typography.regular12.font, color: Asset.Colors.a4A6Ac.color)
    private lazy var titleLabel = makeLabel(font: Typography.semibold18.font, color: Asset.Colors.black.color)
    private lazy var descriptionLabel = makeLabel(font: Typography.regular14.font, color: .darkGray)
    
    var viewsLeadingTrailing: CGFloat = 16.adaptToScreenSize
    var backButtonWidthHeight: CGFloat = 40.adaptToScreenSize

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsDetailCV: BaseCV {
    public func setSubviews() {
        addSubview(scrollView)
        addSubview(backButton)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
    }
}

extension NewsDetailCV {
    func makeButton() -> UIButton {
        let button = UIButton()
        return button
    }
    
    private func makeImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }

    private func makeContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }
    
    private func makeLabel(font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 0
        return label
    }

    func configure(with model: ProfileModel.Response.NewsDetailModel) {
        dateLabel.text = model.date
        titleLabel.text = model.title
        descriptionLabel.text = model.text
        imageView.kf.setImage(with: URL(string: model.image ?? ""))
    }
}

extension NewsDetailCV {
    public func setConstraints() {
        scrollView.anchor(
            .top(topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )

        contentView.anchor(
            .top(scrollView.topAnchor),
            .leading(scrollView.leadingAnchor),
            .trailing(scrollView.trailingAnchor),
            .bottom(scrollView.bottomAnchor)
        )

        contentView.widthAnchor
            .constraint(equalTo: scrollView.widthAnchor)
            .isActive = true
        
        backButton.anchor(
            .top(contentView.topAnchor, constant: viewsLeadingTrailing),
            .leading(contentView.leadingAnchor, constant: viewsLeadingTrailing),
            .height(backButtonWidthHeight),
            .width(backButtonWidthHeight)
        )

        imageView.anchor(
            .top(contentView.topAnchor),
            .leading(contentView.leadingAnchor),
            .trailing(contentView.trailingAnchor),
            .height(260)
        )

        containerView.anchor(
            .top(imageView.bottomAnchor, constant: -24),
            .leading(contentView.leadingAnchor),
            .trailing(contentView.trailingAnchor),
            .bottom(contentView.bottomAnchor)
        )

        dateLabel.anchor(
            .top(containerView.topAnchor, constant: 24),
            .leading(containerView.leadingAnchor, constant: 16)
        )

        titleLabel.anchor(
            .top(dateLabel.bottomAnchor, constant: 12),
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        descriptionLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 16),
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16),
            .bottom(containerView.bottomAnchor, constant: 24)
        )
    }
}

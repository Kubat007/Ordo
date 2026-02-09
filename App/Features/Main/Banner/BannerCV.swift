//
//  BannerCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 26/1/26.
//

import UIKit

final class BannerCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var scrollView = makeScrollView()
    let contentView = UIView()
    lazy var imageView = makeImageView()
    lazy var titleLabel = makeLabel(color: .black, font: Typography.bold16.font)
    lazy var descriptionLabel = makeLabel(color: Asset.Colors._292929.color, font: Typography.regular14.font)
    
    let viewsLeadingTrailing: CGFloat = 16 * Constants.ScreenSizeConstant
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannerCV: BaseCV {
    func setSubviews() {
        addSubview(navigationBar)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
}

extension BannerCV {
    private func setupUI() {
        backgroundColor = Asset.Colors.f7F7Fe.color
    }
    
    func configure(with viewModel: MainModels.Response.Banner) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
        if let urlString = viewModel.image,
           let url = URL(string: urlString) {
             imageView.kf.setImage(with: url)
        }
    }
}

extension BannerCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        navbar.backgroundView.backgroundColor = .clear
        navbar.backgroundColor = .clear
        return navbar
    }
    
    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = Asset.Colors.f7F7Fe.color
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }
    
    func makeLabel(color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = font
        label.numberOfLines = 0
        return label
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }
}

extension BannerCV {
    func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        scrollView.anchor(
            .top(navigationBar.bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
        
        contentView.anchor(
            .top(scrollView.topAnchor),
            .leading(scrollView.leadingAnchor),
            .trailing(scrollView.trailingAnchor),
            .bottom(scrollView.bottomAnchor),
            .widthTo(scrollView.widthAnchor)
        )
        
        imageView.anchor(
            .top(contentView.topAnchor, constant: 36.adaptToScreenSize),
            .leading(contentView.leadingAnchor, constant: viewsLeadingTrailing),
            .trailing(contentView.trailingAnchor, constant: viewsLeadingTrailing),
            .height(330.adaptToScreenSize)
        )
        
        titleLabel.anchor(
            .top(imageView.bottomAnchor, constant: 12.adaptToScreenSize),
            .leading(contentView.leadingAnchor, constant: viewsLeadingTrailing),
            .trailing(contentView.trailingAnchor, constant: viewsLeadingTrailing)
        )
        
        descriptionLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 12.adaptToScreenSize),
            .leading(contentView.leadingAnchor, constant: viewsLeadingTrailing),
            .trailing(contentView.trailingAnchor, constant: viewsLeadingTrailing),
            .bottom(contentView.safeAreaLayoutGuide.bottomAnchor, constant: viewsLeadingTrailing)
        )
    }
}

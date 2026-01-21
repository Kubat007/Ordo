//
//  MoreCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

public final class MoreCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var tableView = makeTableView()
    lazy var checkoutView = makeCheckoutView()
    lazy var checkoutButton = makeButton()
    
    // for emty korzina
    lazy var container = makeContainer()
    private lazy var emtyImage = makeImageView()
    private lazy var titleLabel = makeLabel(text: "В корзине пусто", textColor: Asset.Colors.black.color, font: Typography.semibold14.font)
    private lazy var descriptionLabel = makeLabel(text: "Положите товары в корзину, чтобы купить их сразу или не забыть купить потом", textColor: Asset.Colors.b1Afc6.color, font: Typography.regular12.font)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoreCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(tableView)
        addSubview(checkoutView)
        checkoutView.addSubview(checkoutButton)
        
        addSubview(container)
        container.addSubview(emtyImage)
        container.addSubview(titleLabel)
        container.addSubview(descriptionLabel)
    }
}

extension MoreCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.white.color
        navbar.backgroundView.backgroundColor = Asset.Colors.white.color
        return navbar
    }
    
    private func makeTableView() -> UITableView {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(MoreTVCell.self, forCellReuseIdentifier: MoreTVCell.identifier)
        table.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 100, right: 0)
        return table
    }
    
    private func makeCheckoutView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.45, green: 0.72, blue: 0.35, alpha: 1)
        view.layer.cornerRadius = 16
        view.isHidden = true
        return view
    }
    
    private func makeButton() -> UIButton {
        let b = UIButton()
        b.setTitle("", for: .normal)
        b.titleLabel?.font = Typography.semibold16.font
        b.titleLabel?.numberOfLines = 2
        b.titleLabel?.textAlignment = .center
        b.setTitleColor(.white, for: .normal)
        return b
    }
    
    func makeContainer() -> UIView {
        let view = UIView()
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.backgroundColor = .clear
        image.image = UIImage(named: "emty_cart")
        return image
    }
    
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
}

extension MoreCV {
    public func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        tableView.anchor(
            .top(navigationBar.bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
        
        checkoutView.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 50),
            .height(64)
        )
        
        checkoutButton.centerInSuperview()
        
        container.fillSuperview()
        
        emtyImage.anchor(
            .centerY(container.centerYAnchor),
            .centerX(container.centerXAnchor),
            .height(250),
            .width(250)
        )
        
        titleLabel.anchor(
            .top(emtyImage.bottomAnchor, constant: 12),
            .leading(container.leadingAnchor),
            .trailing(container.trailingAnchor)
        )

        descriptionLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .leading(container.leadingAnchor, constant: 16),
            .trailing(container.trailingAnchor, constant: 16)
        )
    }
}


//
//  OrderCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

import UIKit

public final class OrderCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var tableView = makeTableView()
    lazy var orderButton = makeButton()
    
    var viewsLeadingTrailing: CGFloat = 16.adaptToScreenSize
    var backButtonWidthHeight: CGFloat = 40.adaptToScreenSize

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) { fatalError() }
}


extension OrderCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(tableView)
        addSubview(orderButton)
    }
}


extension OrderCV {
    func updateTotal(_ total: Int) {
        orderButton.setTitle("Заказать     \(total) c", for: .normal)
    }

    private func makeTableView() -> UITableView {
        let t = UITableView(frame: .zero, style: .plain)
        t.separatorStyle = .none
        t.register(OrderTVCell.self, forCellReuseIdentifier: OrderTVCell.identifier)
        t.register(CargoTVCell.self, forCellReuseIdentifier: CargoTVCell.identifier)
        t.register(TitleSectionHeaderView.self, forHeaderFooterViewReuseIdentifier:
                            TitleSectionHeaderView.reuseIdentifier)
        t.contentInset = .init(top: 16, left: 0, bottom: 100, right: 0)
        t.backgroundColor = Asset.Colors.f7F7Fe.color
        return t
    }

    private func makeButton() -> UIButton {
        let b = UIButton()
        b.backgroundColor = UIColor(red: 0.45, green: 0.72, blue: 0.35, alpha: 1)
        b.layer.cornerRadius = 16
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = Typography.semibold16.font
        b.setTitle("Заказать", for: .normal)
        return b
    }
    
    func makeBackButton() -> UIButton {
        let button = UIButton()
        return button
    }
    
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.white.color
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return navbar
    }
}


extension OrderCV {
    public func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        tableView.anchor(
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .top(navigationBar.bottomAnchor),
            .bottom(safeAreaLayoutGuide.bottomAnchor)
        )

        orderButton.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 16),
            .height(56)
        )
    }
}


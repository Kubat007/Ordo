//
//  ProductListItemsCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 11/2/26.
//

import UIKit

public final class ProductListItemsCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var tableView = makeTableView()
    lazy var addButton = makeAddButton()
    lazy var collectButton = makeCollectButton()
    lazy var textField = makeTextField()

    private let headerContainer = UIView()

    var horizontalPadding: CGFloat = 16.adaptToScreenSize
    var buttonHeight: CGFloat = 50.adaptToScreenSize
    var addButtonSize: CGFloat = 36.adaptToScreenSize

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ProductListItemsCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(headerContainer)
        headerContainer.addSubview(textField)
        headerContainer.addSubview(addButton)

        addSubview(tableView)
        addSubview(collectButton)
    }
}

private extension ProductListItemsCV {
    func setupUI() {
        backgroundColor = Asset.Colors.white.color
    }
    
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.white.color
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return navbar
    }
    
    func makeTextField() -> UITextField {
        let f = UITextField()
        f.keyboardType = .default
        f.backgroundColor = UIColor(white: 0.95, alpha: 1)
        f.layer.cornerRadius = 8
        f.textColor = .black
        f.setLeftPadding(12)
        f.addDoneToolbar()
        f.attributedPlaceholder = NSAttributedString(string: "Например 'Масло'", attributes: [.foregroundColor: UIColor.lightGray, .font:UIFont.systemFont(ofSize: 14)])
        return f
    }

    func makeAddButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = Asset.Colors._4986Ff.color
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }

    func makeCollectButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = Asset.Colors._3B75E7.color
        button.layer.cornerRadius = 10
        button.setTitle("Собрать товар из списка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Typography.semibold16.font
        return button
    }

    func makeTableView() -> UITableView {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = Asset.Colors.f7F7Fe.color
        table.register(ProductListItemsTVCell.self,
                       forCellReuseIdentifier: ProductListItemsTVCell.identifier)
        return table
    }
}

extension ProductListItemsCV {
    public func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
        
        headerContainer.anchor(
            .top(navigationBar.bottomAnchor),
            .leading(leadingAnchor, constant: horizontalPadding),
            .trailing(trailingAnchor, constant: horizontalPadding),
            .height(44.adaptToScreenSize)
        )

        addButton.anchor(
            .top(headerContainer.topAnchor),
            .trailing(headerContainer.trailingAnchor),
            .width(addButtonSize),
            .height(addButtonSize)
        )

        textField.anchor(
            .top(headerContainer.topAnchor),
            .leading(headerContainer.leadingAnchor),
            .trailing(addButton.leadingAnchor, constant: 8),
            .height(addButtonSize)
        )

        collectButton.anchor(
            .leading(leadingAnchor, constant: horizontalPadding),
            .trailing(trailingAnchor, constant: horizontalPadding),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: horizontalPadding),
            .height(buttonHeight)
        )

        tableView.anchor(
            .top(headerContainer.bottomAnchor, constant: 12),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(collectButton.topAnchor, constant: 12)
        )
    }
}

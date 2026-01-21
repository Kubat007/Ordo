//
//  HistoryDetailCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit

public final class HistoryDetailCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var tableView = makeTableView()
    lazy var headerView = makeHeaderView()
    lazy var repeatButton = makeButton()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HistoryDetailCV: BaseCV {

    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(tableView)
        addSubview(repeatButton)
    }
}

private extension HistoryDetailCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.backgroundView.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return navbar
    }
    
    func makeTableView() -> UITableView {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.backgroundColor = Asset.Colors.f7F7Fe.color
        table.register(
            HistoryDetailTVCell.self,
            forCellReuseIdentifier: HistoryDetailTVCell.identifier
        )
        table.tableHeaderView = headerView
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        return table
    }

    func makeHeaderView() -> UIView {
        let view = HistoryDetailHeaderView()
        view.frame.size.height = 320
        return view
    }

    func makeButton() -> UIButton {
        let b = UIButton()
        b.setTitle("Повторить заказ", for: .normal)
        b.backgroundColor = UIColor(red: 0.1, green: 0.16, blue: 0.47, alpha: 1)
        b.layer.cornerRadius = 16
        b.titleLabel?.font = Typography.semibold16.font
        b.setTitleColor(.white, for: .normal)
        return b
    }
}

extension HistoryDetailCV {

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

        repeatButton.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 16),
            .height(56)
        )
    }
}

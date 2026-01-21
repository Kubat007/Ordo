//
//  HistoryCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit

public final class HistoryCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var tableView = makeTableView()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HistoryCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(tableView)
    }
}

private extension HistoryCV {
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
            HistoryTVCell.self,
            forCellReuseIdentifier: HistoryTVCell.identifier
        )
        table.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        return table
    }
}

extension HistoryCV {
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
    }
}

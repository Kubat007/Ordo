//
//  NewsCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

import UIKit

public final class NewsCV: UIView {
    lazy var tableView = makeTableView()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsCV: BaseCV {
    public func setSubviews() {
        addSubview(tableView)
    }
}

extension NewsCV {

    private func makeTableView() -> UITableView {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.register(NewsTVCell.self, forCellReuseIdentifier: NewsTVCell.identifier)
        return table
    }

    public func setConstraints() {
        tableView.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
    }
}

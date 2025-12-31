//
//  FAQCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

public final class FAQCV: UIView {
    lazy var tableView = makeTableView()
    lazy var backButton = makeButton()

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

extension FAQCV: BaseCV {
    public func setSubviews() {
        addSubview(backButton)
        addSubview(tableView)
    }
}

extension FAQCV {

    private func makeTableView() -> UITableView {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.register(FAQTVCell.self, forCellReuseIdentifier: FAQTVCell.identifier)
        table.backgroundColor = Asset.Colors.white.color
        return table
    }

    private func makeButton() -> UIButton {
        let button = UIButton()
        return button
    }

    public func setConstraints() {
        backButton.anchor(
            .leading(leadingAnchor, constant: viewsLeadingTrailing),
            .top(safeAreaLayoutGuide.topAnchor, constant: viewsLeadingTrailing),
            .height(backButtonWidthHeight),
            .width(backButtonWidthHeight)
        )

        tableView.anchor(
            .top(backButton.bottomAnchor, constant: 8),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
    }
}

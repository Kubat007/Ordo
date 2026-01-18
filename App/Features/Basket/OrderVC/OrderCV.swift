//
//  OrderCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

import UIKit

public final class OrderCV: UIView {

    lazy var tableView = makeTableView()
    lazy var orderButton = makeButton()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) { fatalError() }
}


extension OrderCV: BaseCV {
    public func setSubviews() {
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
}


extension OrderCV {
    public func setConstraints() {
        tableView.fillSuperview()

        orderButton.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 16),
            .height(56)
        )
    }
}


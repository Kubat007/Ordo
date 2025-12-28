//
//  MoreCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

public final class MoreCV: UIView {
    
    lazy var tableView = makeTableView()
    lazy var checkoutView = makeCheckoutView()
    private lazy var checkoutLabel = makeCheckoutLabel()
    
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
        addSubview(tableView)
        addSubview(checkoutView)
        checkoutView.addSubview(checkoutLabel)
    }
}

extension MoreCV {
    
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
        return view
    }
    
    private func makeCheckoutLabel() -> UILabel {
        let label = UILabel()
        label.text = "К оформлению\n4 шт. | 1 520.0 KGS"
        label.textColor = .white
        label.font = Typography.semibold16.font
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }
}

extension MoreCV {
    public func setConstraints() {
        
        tableView.fillSuperview()
        
        checkoutView.anchor(
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 16),
            .height(64)
        )
        
        checkoutLabel.centerInSuperview()
    }
}


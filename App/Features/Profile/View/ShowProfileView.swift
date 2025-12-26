//
//  ShowProfileView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 24/12/25.
//

import UIKit

class ShowProfileView: UIView {
    
    lazy var tableView = UITableView(frame: .zero, style: .grouped)
    let headerView = ProfileHeaderView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTable() {
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.backgroundColor = .clear
        
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120)
        tableView.tableHeaderView = headerView
    }
}

extension ShowProfileView: BaseCV {
    public func setSubviews() {
        addSubview(tableView)
    }
}

extension ShowProfileView {
    public func setConstraints() {
        tableView.fillSuperview()
    }
}

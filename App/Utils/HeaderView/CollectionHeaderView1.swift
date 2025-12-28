//
//  ColeectionHeaderView1.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/12/25.
//

import UIKit
import Foundation

final class CollectionHeaderView1: UICollectionReusableView, ReusableView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.anchor(
            .top(topAnchor),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(bottomAnchor)
        )
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}

//
//  CargoTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 18/1/26.
//

import UIKit

final class CargoTVCell: UITableViewCell {
    static let identifier = "CargoTVCell"

    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let radio = UIImageView()
    
    private let warningContainer = UIView()
    private let warningLabel = UILabel()
    
    var anchoredConstraints: AnchoredConstraints?
    
    var onSelect: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        setUI()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(model: OrderCellModel, row: Int, vm: OrderVM) {
        titleLabel.text = model.title
        subtitleLabel.isHidden = true // Убираем subtitle если он не нужен
        if row == 0 {
            radio.isHighlighted = (vm.selectedLoader == .yes)
        } else {
            radio.isHighlighted = (vm.selectedLoader == .no)
        }
        onSelect = {
            vm.selectLoader(row == 0 ? .yes : .no)
        }
        if row == 0 {
            warningContainer.isHidden = false
        } else {
            warningContainer.isHidden = true
        }
    }
}

private extension CargoTVCell {
    func setSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(radio)
        
        contentView.addSubview(warningContainer)
        warningContainer.addSubview(warningLabel)
    }
    
    func setUI() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 6
        
        titleLabel.font = Typography.semibold16.font
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        
        radio.image = UIImage(systemName: "circle")
        radio.highlightedImage = UIImage(systemName: "largecircle.fill.circle")
        radio.tintColor = Asset.Colors._4986Ff.color
        
        warningContainer.backgroundColor = Asset.Colors.f7F7Fe.color
        warningContainer.layer.cornerRadius = 6
        
        warningLabel.text = "Внимание: стоимость грузчиков оплачивается отдельно, стоимость зависит от объема заказа и количество этажей"
        warningLabel.font = Typography.regular12.font
        warningLabel.textColor = Asset.Colors.warning.color
        warningLabel.numberOfLines = 0
        warningLabel.textAlignment = .left
    }
}

extension CargoTVCell {
    func setConstraints() {
        anchoredConstraints = containerView.anchor(
            .top(contentView.topAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .height(50) // Высота для выбора
        )
        
        titleLabel.anchor(
            .leading(containerView.leadingAnchor, constant: 16),
            .centerY(containerView.centerYAnchor)
        )
        
        radio.anchor(
            .trailing(containerView.trailingAnchor, constant: 16),
            .centerY(containerView.centerYAnchor),
            .width(24),
            .height(24)
        )
        
        warningContainer.anchor(
            .top(containerView.bottomAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 8)
        )
        
        warningLabel.anchor(
            .top(warningContainer.topAnchor, constant: 12),
            .leading(warningContainer.leadingAnchor, constant: 16),
            .trailing(warningContainer.trailingAnchor, constant: 16),
            .bottom(warningContainer.bottomAnchor, constant: 12)
        )
    }
}

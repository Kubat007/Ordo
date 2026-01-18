//
//  OrderTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

import UIKit

final class OrderTVCell: UITableViewCell {
    static let identifier = "OrderTVCell"

    private let containerView = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let arrowView = UIImageView()
    private let radio = UIImageView()
    
    var anchoredConstraints: AnchoredConstraints?
    
    private var titleLabelCenterYConstraint: NSLayoutConstraint?
    private var titleLabelTopConstraint: NSLayoutConstraint?
    
    var onSelect: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        setUI()
        backgroundColor = Asset.Colors.b7B7B7.color
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(model: OrderCellModel, section: Int, row: Int, vm: OrderVM) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        subtitleLabel.isHidden = model.subtitle == nil
        iconView.image = model.image
        arrowView.isHidden = !model.showArrow
        
        resetToDefaultState()
        
        switch section {
        case 0: radio.isHidden = true
        case 1: radio.isHidden = true
        case 2:
            radio.isHidden = false
            radio.isHighlighted =
            (row == 0 && vm.selectedPayment == .cash) ||
            (row == 1 && vm.selectedPayment == .visa)
            onSelect = {
                vm.selectPayment(row == 0 ? .cash : .visa)
            }
        case 3:
            radio.isHidden = false
            radio.isHighlighted =
            (row == 0 && vm.selectedDelivery == .courier) ||
            (row == 1 && vm.selectedDelivery == .pickup)
            onSelect = {
                vm.selectDelivery(row == 0 ? .courier : .pickup)
            }
        case 4:
            radio.isHidden = false
            radio.isHighlighted =
            (row == 0 && vm.selectedLoader == .yes) ||
            (row == 1 && vm.selectedLoader == .no)
            onSelect = {
                vm.selectLoader(row == 0 ? .yes : .no)
            }
            if row == 1 {
                anchoredConstraints?.height?.constant = 88
                titleLabelCenterYConstraint?.isActive = false
                titleLabelTopConstraint?.isActive = true
            }
        default:
            onSelect = nil
        }
    }
    
    private func resetToDefaultState() {
        anchoredConstraints?.height?.constant = 44
        containerView.backgroundColor = .white
        
        titleLabelTopConstraint?.isActive = false
        titleLabelCenterYConstraint?.isActive = true
        
        titleLabel.textColor = .black
    }
}

private extension OrderTVCell {
    func setSubviews() {
        contentView.addSubview(containerView)

        containerView.addSubview(iconView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(arrowView)
        containerView.addSubview(radio)
    }
    
    func setUI() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 6
        
        titleLabel.font = Typography.semibold16.font
        subtitleLabel.font = Typography.regular14.font
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
                titleLabel.lineBreakMode = .byWordWrapping
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
                titleLabel.setContentHuggingPriority(.required, for: .vertical)
        subtitleLabel.textColor = .systemGray
        subtitleLabel.backgroundColor = .purple

        arrowView.image = Asset.Images.Disclosure.disclosure_right.image
        radio.image = UIImage(systemName: "circle")
        radio.highlightedImage = UIImage(systemName: "largecircle.fill.circle")
        radio.tintColor = .black
    }
}

extension OrderTVCell {
    func setConstraints() {
        anchoredConstraints = containerView.anchor(
            .top(contentView.topAnchor),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor),
            .height(44)
        )
        
        iconView.anchor(
            .leading(containerView.leadingAnchor, constant: 16),
            .centerY(containerView.centerYAnchor),
            .width(24),
            .height(24)
        )
        
        titleLabelCenterYConstraint = titleLabel.centerYAnchor.constraint(
            equalTo: containerView.centerYAnchor
        )
        titleLabelCenterYConstraint?.isActive = true
        
        titleLabelTopConstraint = titleLabel.topAnchor.constraint(
            equalTo: containerView.topAnchor,
            constant: 12
        )
        titleLabelTopConstraint?.isActive = false
        
        titleLabel.anchor(
            .leading(iconView.trailingAnchor, constant: 12),
            .trailing(arrowView.leadingAnchor, constant: 8)
        )

        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 4),
            .leading(titleLabel.leadingAnchor),
            .trailing(titleLabel.trailingAnchor),
            .bottom(containerView.bottomAnchor, constant: 12)
        )

        arrowView.anchor(
            .trailing(containerView.trailingAnchor, constant: 16),
            .centerY(containerView.centerYAnchor),
            .width(16),
            .height(16)
        )
        
        radio.anchor(
            .trailing(containerView.trailingAnchor, constant: 16),
            .centerY(containerView.centerYAnchor),
            .width(24),
            .height(24)
        )
    }
}

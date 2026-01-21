//
//  OrderTVCell.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

import UIKit

protocol OrderTVCellDelegate: AnyObject {
    func didTapDateButton(cell: OrderTVCell)
    func didEnterAddress(_ address: String)
}

final class OrderTVCell: UITableViewCell {
    static let identifier = "OrderTVCell"

    private let containerView = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let adressTextFiekd = UITextField()
    private let subtitleLabel = UILabel()
    private let arrowView = UIImageView()
    private let radio = UIImageView()
    private let dateButton = UIButton(type: .system)
    var anchoredConstraints: AnchoredConstraints?
    
    private var titleLeadingConstraint: NSLayoutConstraint?
    private var iconWidthConstraint: NSLayoutConstraint?
    
    var selectedDate: Date?
    var adressText: String?
    var onSelect: (() -> Void)?
    weak var delegate: OrderTVCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        setUI()
        backgroundColor = Asset.Colors.f7F7Fe.color
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
        adressTextFiekd.text = vm.enteredAddress
        arrowView.isHidden = !model.showArrow
        adressTextFiekd.isHidden = !model.showTextField
        titleLabel.isHidden = !model.showTitleLabel
        dateButton.isHidden = !model.showDateButton
        
        if model.image == nil {
            iconView.isHidden = true
            iconWidthConstraint?.constant = 0
            titleLeadingConstraint?.constant = 8
        } else {
            iconView.isHidden = false
            iconWidthConstraint?.constant = 24
            titleLeadingConstraint?.constant = 12
        }
        layoutIfNeeded()
        
        switch section {
        case 0:
            radio.isHidden = true
            let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: Asset.Colors._232837.color, .font: Typography.regular14.font]
            adressTextFiekd.attributedPlaceholder = NSAttributedString(
                string: "Ведите адрес",
                attributes: placeholderAttributes)
            adressTextFiekd.isUserInteractionEnabled = true
        case 1:
            radio.isHidden = true
            dateButton.setTitle("Выберите дату и время", for: .normal)
            dateButton.setTitleColor(.systemGray, for: .normal)
            adressTextFiekd.isUserInteractionEnabled = false
            if let selectedDate = vm.selectedDate {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"
                dateButton.setTitle(formatter.string(from: selectedDate), for: .normal)
                dateButton.setTitleColor(.black, for: .normal)
            }
        case 2:
            radio.isHidden = false
            radio.isHighlighted =
            (row == 0 && vm.selectedPayment == .cash) || (row == 1 && vm.selectedPayment == .visa)
            onSelect = {
                vm.selectPayment(row == 0 ? .cash : .visa)
            }
        case 3:
            radio.isHidden = false
            radio.isHighlighted =
            (row == 0 && vm.selectedDelivery == .courier) || (row == 1 && vm.selectedDelivery == .pickup)
            onSelect = {
                vm.selectDelivery(row == 0 ? .courier : .pickup)
            }
        case 4:
            radio.isHidden = false
            radio.isHighlighted =
            (row == 0 && vm.selectedLoader == .yes) || (row == 1 && vm.selectedLoader == .no)
            onSelect = {
                vm.selectLoader(row == 0 ? .yes : .no)
            }
        default:
            onSelect = nil
        }
    }
}

private extension OrderTVCell {
    func setSubviews() {
        contentView.addSubview(containerView)

        containerView.addSubview(dateButton)
        containerView.addSubview(iconView)
        containerView.addSubview(adressTextFiekd)
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
        subtitleLabel.textColor = .systemGray
        subtitleLabel.numberOfLines = 0
        adressTextFiekd.textColor = .black
        adressTextFiekd.textColor = .black
        adressTextFiekd.returnKeyType = .done
        adressTextFiekd.delegate = self
        adressTextFiekd.autocorrectionType = .no
        
        dateButton.contentHorizontalAlignment = .left
        dateButton.titleLabel?.font = Typography.regular14.font
        dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
        
        arrowView.image = Asset.Images.Disclosure.disclosure_right.image
        radio.image = UIImage(systemName: "circle")
        radio.highlightedImage = UIImage(systemName: "largecircle.fill.circle")
        radio.tintColor = Asset.Colors._4986Ff.color
    }
}

@objc
extension OrderTVCell {
    func dateButtonTapped() {
        delegate?.didTapDateButton(cell: self)
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
            .centerY(containerView.centerYAnchor)
        )
        iconWidthConstraint = iconView.widthAnchor.constraint(equalToConstant: 24)
        iconWidthConstraint?.isActive = true
        iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor).isActive = true
        
        titleLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12)
        titleLeadingConstraint?.isActive = true
        
        titleLabel.anchor(
            .trailing(arrowView.leadingAnchor, constant: 8),
            .centerY(containerView.centerYAnchor)
        )
        
        adressTextFiekd.anchor(
            .trailing(containerView.trailingAnchor),
            .leading(containerView.leadingAnchor),
            .top(containerView.topAnchor),
            .bottom(containerView.bottomAnchor)
        )
        
        
        dateButton.anchor(
            .leading(containerView.leadingAnchor),
            .trailing(containerView.trailingAnchor),
            .top(containerView.topAnchor),
            .bottom(containerView.bottomAnchor)
        )
        

        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 4),
            .leading(titleLabel.leadingAnchor),
            .trailing(titleLabel.trailingAnchor)
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
        
        let bottomConstraint = containerView.bottomAnchor.constraint(greaterThanOrEqualTo: subtitleLabel.bottomAnchor, constant: 12)
        bottomConstraint.priority = .defaultHigh
        bottomConstraint.isActive = true
    }
}

extension OrderTVCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            self.adressText = text
            delegate?.didEnterAddress(text)
        }
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let currentText = textField.text ?? ""
//        guard let stringRange = Range(range, in: currentText) else { return false }
//        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.delegate?.didEnterAddress(updatedText)
//        }
//        return true
//    }
}

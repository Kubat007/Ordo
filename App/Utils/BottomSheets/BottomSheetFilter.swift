//
//  BottomSheetFilter.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/12/25.
//

import UIKit
import Foundation

final class FilterBottomSheetCV: UIView {
    private lazy var titleLabel = makeLabel("Фильтры", Typography.semibold18.font)
    lazy var categoryButton = makeArrowButton("Выбрать категорию")

    private lazy var priceLabel = makeLabel("Цена", Typography.semibold14.font)
    lazy var fromField = makeTextField("Цена, от")
    lazy var toField = makeTextField("Цена, до")
    lazy var currencyButton = makeCurrencyButton()

    private lazy var sortLabel = makeLabel("Сортировать", Typography.semibold14.font)
    lazy var dateAscButton = makeToggleButton("По дате: возрастание")
    lazy var dateDescButton = makeToggleButton("По дате: убывание")
    lazy var expensiveButton = makeToggleButton("Дороже")
    lazy var cheapButton = makeToggleButton("Дешевле")
    lazy var showButton = makeShowButton()
    private var state = FilterState()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        setSubviews()
        setConstraints()
        setupActions()
        updateUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension FilterBottomSheetCV {
    func setupActions() {
        dateAscButton.addTarget(self, action: #selector(dateAscTapped), for: .touchUpInside)
        dateDescButton.addTarget(self, action: #selector(dateDescTapped), for: .touchUpInside)
        expensiveButton.addTarget(self, action: #selector(expensiveTapped), for: .touchUpInside)
        cheapButton.addTarget(self, action: #selector(cheapTapped), for: .touchUpInside)
    }

    @objc func dateAscTapped() {
        state.dateSort = state.dateSort == .asc ? nil : .asc
        updateUI()
    }

    @objc func dateDescTapped() {
        state.dateSort = state.dateSort == .desc ? nil : .desc
        updateUI()
    }

    @objc func expensiveTapped() {
        state.priceSort = state.priceSort == .expensive ? nil : .expensive
        updateUI()
    }

    @objc func cheapTapped() {
        state.priceSort = state.priceSort == .cheap ? nil : .cheap
        updateUI()
    }
}

private extension FilterBottomSheetCV {
    func updateUI() {
        updateButton(dateAscButton, selected: state.dateSort == .asc)
        updateButton(dateDescButton, selected: state.dateSort == .desc)

        updateButton(expensiveButton, selected: state.priceSort == .expensive)
        updateButton(cheapButton, selected: state.priceSort == .cheap)

        showButton.backgroundColor = state.isValid
        ? Asset.Colors._4Ab3Ff.color
        : Asset.Colors.b0B0B0.color
    }

    func updateButton(_ button: UIButton, selected: Bool) {
        button.backgroundColor = selected
        ? Asset.Colors.black.color.withAlphaComponent(0.12)
        : .clear

        button.setTitleColor(
            selected ? Asset.Colors._4Ab3Ff.color : Asset.Colors.b0B0B0.color,
            for: .normal
        )

        button.setImage(
            selected ? UIImage(systemName: "checkmark") : nil,
            for: .normal
        )

        button.tintColor = Asset.Colors._4Ab3Ff.color
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
    }
}

// MARK: - Factory

private extension FilterBottomSheetCV {
    func makeLabel(_ text: String, _ font: UIFont) -> UILabel {
        let l = UILabel()
        l.text = text
        l.font = font
        l.textColor = .black
        return l
    }

    func makeArrowButton(_ title: String) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.contentHorizontalAlignment = .left
        b.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        b.semanticContentAttribute = .forceRightToLeft
        return b
    }

    func makeTextField(_ placeholder: String) -> UITextField {
        let f = UITextField()
        f.keyboardType = .numberPad
        f.backgroundColor = UIColor(white: 0.95, alpha: 1)
        f.layer.cornerRadius = 8
        f.textColor = .black
        f.setLeftPadding(12)
        f.addDoneToolbar()
        f.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
        return f
    }

    func makeCurrencyButton() -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle("KGS", for: .normal)
        b.backgroundColor = UIColor(white: 0.95, alpha: 1)
        b.layer.cornerRadius = 8
        return b
    }

    func makeToggleButton(_ title: String) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.contentHorizontalAlignment = .left
        return b
    }

    func makeShowButton() -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle("Показать", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 12
        return b
    }
}

// MARK: - Layout

extension FilterBottomSheetCV: BaseCV {
    func setSubviews() {
        addSubview(titleLabel)
        addSubview(categoryButton)
        addSubview(priceLabel)
        addSubview(fromField)
        addSubview(toField)
        addSubview(currencyButton)
        addSubview(sortLabel)
        addSubview(dateAscButton)
        addSubview(dateDescButton)
        addSubview(expensiveButton)
        addSubview(cheapButton)
        addSubview(showButton)
    }

    func setConstraints() {
        titleLabel.anchor(
            .top(safeAreaLayoutGuide.topAnchor, constant: 16),
            .leading(leadingAnchor, constant: 32)
        )

        categoryButton.anchor(
            .top(titleLabel.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16)
        )

        priceLabel.anchor(
            .top(categoryButton.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16)
        )

        fromField.anchor(
            .top(priceLabel.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16),
            .width(100),
            .height(44)
        )

        toField.anchor(
            .leading(fromField.trailingAnchor, constant: 8),
            .centerY(fromField.centerYAnchor),
            .width(100),
            .height(44)
        )

        currencyButton.anchor(
            .leading(toField.trailingAnchor, constant: 8),
            .trailing(trailingAnchor, constant: 16),
            .centerY(fromField.centerYAnchor),
            .height(44)
        )

        sortLabel.anchor(
            .top(fromField.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16)
        )

        dateAscButton.anchor(
            .top(sortLabel.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16)
        )

        dateDescButton.anchor(
            .top(dateAscButton.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16)
        )

        expensiveButton.anchor(
            .top(dateDescButton.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16)
        )

        cheapButton.anchor(
            .top(expensiveButton.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 16)
        )

        showButton.anchor(
//            .top(cheapButton.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .height(52),
            .bottom(bottomAnchor, constant: 16)
        )
    }
}

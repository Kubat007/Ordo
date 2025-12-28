//
//  BottomSheetFilter.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/12/25.
//

import UIKit
import Foundation

struct FilterBottomSheetModel {
    var category: String?
    var priceFrom: String?
    var priceTo: String?
    var currency: Currency = .kgs
    var sort: SortType?
}

enum SortType {
    case dateAsc
    case dateDesc
    case expensive
    case cheap
}

enum Currency: String, CaseIterable {
    case kgs = "KGS"
    case usd = "USD"
    case eur = "EUR"
}

import UIKit

final class FilterBottomSheetCV: UIView {

    // MARK: UI
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) { fatalError() }
}

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
        f.placeholder = placeholder
        f.keyboardType = .numberPad
        f.backgroundColor = UIColor(white: 0.95, alpha: 1)
        f.layer.cornerRadius = 8
        f.setLeftPadding(12)
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
        b.setTitleColor(.gray, for: .normal)
        b.contentHorizontalAlignment = .left
        b.setImage(UIImage(systemName: "checkmark"), for: .selected)
        b.tintColor = .systemBlue
        return b
    }

    func makeShowButton() -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle("Показать", for: .normal)
        b.backgroundColor = .systemGray
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 12
        return b
    }
}

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

        titleLabel.anchor(.top(topAnchor, constant: 16), .centerX(centerXAnchor))

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

        dateAscButton.anchor(.top(sortLabel.bottomAnchor, constant: 8), .leading(leadingAnchor, constant: 16))
        dateDescButton.anchor(.top(dateAscButton.bottomAnchor, constant: 8), .leading(leadingAnchor, constant: 16))
        expensiveButton.anchor(.top(dateDescButton.bottomAnchor, constant: 8), .leading(leadingAnchor, constant: 16))
        cheapButton.anchor(.top(expensiveButton.bottomAnchor, constant: 8), .leading(leadingAnchor, constant: 16))

        showButton.anchor(
            .top(cheapButton.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .height(52),
            .bottom(bottomAnchor, constant: -16)
        )
    }
}

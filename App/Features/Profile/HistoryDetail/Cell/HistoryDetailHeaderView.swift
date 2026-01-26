//
//  HistoryDetailHeaderView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit

final class HistoryDetailHeaderView: UIView {
    private let containerView = UIView()

    private lazy var orderTitleLabel = makeTitle("Номер заказа")
    private lazy var addressTitleLabel = makeTitle("Адрес")
    private lazy var dateTitleLabel = makeTitle("Дата доставки")
    private lazy var statusTitleLabel = makeTitle("Статус заказа")
    private lazy var paymentTitleLabel = makeTitle("Способ оплаты")
    private lazy var deliveryTitleLabel = makeTitle("Способ доставки")
    private lazy var loaderTitleLabel = makeTitle("Услуги грузчика")
    private lazy var deliverySumTitleLabel = makeTitle("Сумма доставки")
    private lazy var loaderSumTitleLabel = makeTitle("Оплата грузчикам")
    private lazy var productsSumTitleLabel = makeTitle("Сумма товара")
    private lazy var totalTitleLabel = makeBoldTitle("Итого")

    private lazy var orderLabel = makeValue()
    private lazy var addressLabel = makeValue()
    private lazy var dateLabel = makeValue()
    private lazy var statusLabel = makeValue()
    private lazy var paymentLabel = makeValue()
    private lazy var deliveryLabel = makeValue()
    private lazy var loaderLabel = makeValue()
    private lazy var deliverySumLabel = makeValue()
    private lazy var loaderSumLabel = makeValue()
    private lazy var productsSumLabel = makeValue()
    private lazy var totalLabel = makeBoldValue()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(model: CartModel.Response.Order) {
        orderLabel.text = "#\(model.id ?? 0)"
        addressLabel.text = model.address
        dateLabel.text = model.delivery_date
        statusLabel.text = model.status
        paymentLabel.text = model.payment_method
        deliveryLabel.text = model.delivery_method
        loaderLabel.text = model.loader_service == true ? "Да" : "Нет"
        deliverySumLabel.text = "\(model.delivery_cost ?? 0) KGS"
        loaderSumLabel.text = "\(model.loader_cost ?? 0) KGS"
        productsSumLabel.text = "\(model.total_amount ?? 0) KGS"
        totalLabel.text = "\(model.total_amount ?? 0) KGS"
        statusLabel.textColor = model.status == "placed"
        ? UIColor.systemOrange
        : UIColor.systemGreen
    }
}

private extension HistoryDetailHeaderView {
    func setup() {
        backgroundColor = .clear
        containerView.backgroundColor = Asset.Colors.f7F7Fe.color
        containerView.layer.cornerRadius = 16
        
    }

    func setSubviews() {
        addSubview(containerView)
        [
            orderTitleLabel, orderLabel,
            addressTitleLabel, addressLabel,
            dateTitleLabel, dateLabel,
            statusTitleLabel, statusLabel,
            paymentTitleLabel, paymentLabel,
            deliveryTitleLabel, deliveryLabel,
            loaderTitleLabel, loaderLabel,
            deliverySumTitleLabel, deliverySumLabel,
            loaderSumTitleLabel, loaderSumLabel,
            productsSumTitleLabel, productsSumLabel,
            totalTitleLabel, totalLabel
        ].forEach { containerView.addSubview($0) }
    }
}

private extension HistoryDetailHeaderView {
    func setConstraints() {
        containerView.anchor(
            .top(topAnchor, constant: 16),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .bottom(bottomAnchor)
        )

        orderTitleLabel.anchor(
            .top(containerView.topAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        orderLabel.anchor(
            .centerY(orderTitleLabel.centerYAnchor),
            .leading(orderTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        addressTitleLabel.anchor(
            .top(orderTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        addressLabel.anchor(
            .centerY(addressTitleLabel.centerYAnchor),
            .leading(addressTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        dateTitleLabel.anchor(
            .top(addressTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        dateLabel.anchor(
            .centerY(dateTitleLabel.centerYAnchor),
            .leading(dateTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        statusTitleLabel.anchor(
            .top(dateTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        statusLabel.anchor(
            .centerY(statusTitleLabel.centerYAnchor),
            .leading(statusTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        paymentTitleLabel.anchor(
            .top(statusTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        paymentLabel.anchor(
            .centerY(paymentTitleLabel.centerYAnchor),
            .leading(paymentTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        deliveryTitleLabel.anchor(
            .top(paymentTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        deliveryLabel.anchor(
            .centerY(deliveryTitleLabel.centerYAnchor),
            .leading(deliveryTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        loaderTitleLabel.anchor(
            .top(deliveryTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        loaderLabel.anchor(
            .centerY(loaderTitleLabel.centerYAnchor),
            .leading(loaderTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        deliverySumTitleLabel.anchor(
            .top(loaderTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        deliverySumLabel.anchor(
            .centerY(deliverySumTitleLabel.centerYAnchor),
            .leading(deliverySumTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        loaderSumTitleLabel.anchor(
            .top(deliverySumTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        loaderSumLabel.anchor(
            .centerY(loaderSumTitleLabel.centerYAnchor),
            .leading(loaderSumTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        productsSumTitleLabel.anchor(
            .top(loaderSumTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        productsSumLabel.anchor(
            .centerY(productsSumTitleLabel.centerYAnchor),
            .leading(productsSumTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        totalTitleLabel.anchor(
            .top(productsSumTitleLabel.bottomAnchor, constant: 8),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(140)
        )
        totalLabel.anchor(
            .centerY(totalTitleLabel.centerYAnchor),
            .leading(totalTitleLabel.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

    }
}

private extension HistoryDetailHeaderView {
    func makeTitle(_ text: String) -> UILabel {
        let l = UILabel()
        l.text = text
        l.textColor = Asset.Colors._808191.color
        l.font = Typography.regular14.font
        return l
    }

    func makeValue() -> UILabel {
        let l = UILabel()
        l.textColor = Asset.Colors.black.color
        l.font = Typography.regular14.font
        l.textAlignment = .right
        l.numberOfLines = 0
        return l
    }

    func makeBoldTitle(_ text: String) -> UILabel {
        let l = makeTitle(text)
        l.font = Typography.semibold16.font
        l.textColor = .black
        return l
    }

    func makeBoldValue() -> UILabel {
        let l = makeValue()
        l.font = Typography.semibold16.font
        return l
    }
}

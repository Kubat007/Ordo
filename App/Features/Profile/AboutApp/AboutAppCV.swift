//
//  AboutAppCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

import UIKit

public final class AboutAppCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let devDateTitle = makeGrayLabel(text: "Дата разработки:")
    private let devDateValue = makeBlackLabel()
    private let contactTitle = makeGrayLabel(text: "Имя контакта:")
    private let contactValue = makeBlackLabel()
    private let versionTitle = makeGrayLabel(text: "Версия приложения:")
    private let versionValue = makeBlackLabel()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension AboutAppCV: BaseCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(devDateTitle)
        addSubview(devDateValue)
        addSubview(contactTitle)
        addSubview(contactValue)
        addSubview(versionTitle)
        addSubview(versionValue)
    }
}

extension AboutAppCV {
    func setupUI() {
        backgroundColor = .white
        logoImageView.image = Asset.Images.ordoLogo.image
        logoImageView.contentMode = .scaleAspectFit
        titleLabel.text = "Ordo"
        titleLabel.font = Typography.semibold20.font
        titleLabel.textColor = .black
    }

    func makeNavigationBar() -> CustomNavigationBar {
        let bar = CustomNavigationBar(style: .small)
        bar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        bar.backgroundColor = .white
        bar.backgroundView.backgroundColor = .white
        bar.titleLabel.text = "Приложение"
        return bar
    }

    static func makeGrayLabel(text: String) -> UILabel {
        let l = UILabel()
        l.text = text
        l.font = Typography.regular14.font
        l.textColor = Asset.Colors._808191.color
        return l
    }

    static func makeBlackLabel() -> UILabel {
        let l = UILabel()
        l.font = Typography.regular14.font
        l.textColor = .black
        return l
    }
}

extension AboutAppCV {
    func setData(
        devDate: String,
        contact: String,
        version: String
    ) {
        devDateValue.text = devDate
        contactValue.text = contact
        versionValue.text = version
    }

    public func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )

        logoImageView.anchor(
            .top(navigationBar.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16),
            .width(80),
            .height(80)
        )

        titleLabel.anchor(
            .centerY(logoImageView.centerYAnchor),
            .leading(logoImageView.trailingAnchor, constant: 12)
        )

        devDateTitle.anchor(
            .top(logoImageView.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 16)
        )

        devDateValue.anchor(
            .centerY(devDateTitle.centerYAnchor),
            .leading(devDateTitle.trailingAnchor, constant: 8)
        )

        contactTitle.anchor(
            .top(devDateTitle.bottomAnchor, constant: 12),
            .leading(devDateTitle.leadingAnchor)
        )

        contactValue.anchor(
            .centerY(contactTitle.centerYAnchor),
            .leading(contactTitle.trailingAnchor, constant: 8)
        )

        versionTitle.anchor(
            .top(contactTitle.bottomAnchor, constant: 12),
            .leading(devDateTitle.leadingAnchor)
        )

        versionValue.anchor(
            .centerY(versionTitle.centerYAnchor),
            .leading(versionTitle.trailingAnchor, constant: 8)
        )
    }
}

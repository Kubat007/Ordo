//
//  DeletePopUp.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 1/1/26.
//

import UIKit
import Kingfisher

final class DeletePopUp: UIViewController {
    private lazy var dimView = makeView(
        color: UIColor.black.withAlphaComponent(0.4),
        radius: 0,
        alpha: 0
    )

    private lazy var containerView = makeContainerView()

    private lazy var titleLabel = makeLabel(
        font: Typography.semibold18.font,
        text: ""
    )

    private lazy var imageView = makeImageView()

    private lazy var nameLabel = makeLabel(
        font: Typography.semibold16.font,
        text: ""
    )

    private lazy var priceLabel = makeLabel(
        font: Typography.semibold14.font,
        text: ""
    )

    private lazy var cancelButton = makeSecondaryButton(title: "Отмена")
    private lazy var deleteButton = makePrimaryButton(title: "Удалить")

    private var model: DeletePopUpModel?

    var onDelete: (() -> Void)?
    var onCancel: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShow()
    }
}

extension DeletePopUp {
    func configure(_ model: DeletePopUpModel) {
        self.model = model
        titleLabel.text = model.title
        nameLabel.text = model.productName
        priceLabel.text = model.price

        if let image = model.image {
            imageView.kf.setImage(with: URL(string: image))
        }
    }
}

@objc
private extension DeletePopUp {
    func cancelTapped() {
        onCancel?()
        dismissPopup()
    }

    func deleteTapped() {
        onDelete?()
        dismissPopup()
    }
}

private extension DeletePopUp {
    func animateShow() {
        dimView.alpha = 0
        containerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

        UIView.animate(withDuration: 0.25) {
            self.dimView.alpha = 1
            self.containerView.transform = .identity
        }
    }

    func dismissPopup() {
        UIView.animate(
            withDuration: 0.2,
            animations: {
                self.dimView.alpha = 0
                self.containerView.alpha = 0
            },
            completion: { _ in
                self.dismiss(animated: false)
            }
        )
    }
}

private extension DeletePopUp {
    func setSubviews() {
        view.addSubview(dimView)
        view.addSubview(containerView)

        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(cancelButton)
        containerView.addSubview(deleteButton)
    }

    func makeView(color: UIColor, radius: CGFloat, alpha: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.cornerRadius = radius
        view.alpha = alpha
        return view
    }

    func makeContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }

    func makeLabel(font: UIFont, text: String) -> UILabel {
        let label = UILabel()
        label.font = font
        label.text = text
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }

    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemGray5
        return image
    }

    func makeSecondaryButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = Typography.semibold14.font
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }

    func makePrimaryButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(red: 0.84, green: 0.22, blue: 0.38, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = Typography.semibold14.font
        button.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        return button
    }
}

extension DeletePopUp {
    func setConstraints() {
        dimView.fillSuperview()

        containerView.anchor(
            .centerX(view.centerXAnchor),
            .centerY(view.centerYAnchor),
            .leading(view.leadingAnchor, constant: 24),
            .trailing(view.trailingAnchor, constant: 24)
        )

        titleLabel.anchor(
            .top(containerView.topAnchor, constant: 20),
            .centerX(containerView.centerXAnchor)
        )

        imageView.anchor(
            .top(titleLabel.bottomAnchor, constant: 16),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(64),
            .height(64)
        )

        nameLabel.anchor(
            .top(imageView.topAnchor),
            .leading(imageView.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        priceLabel.anchor(
            .top(nameLabel.bottomAnchor, constant: 8),
            .leading(nameLabel.leadingAnchor)
        )

        deleteButton.anchor(
            .top(cancelButton.topAnchor),
            .leading(cancelButton.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16),
            .height(48),
            .bottom(containerView.bottomAnchor, constant: 16)
        )

        cancelButton.anchor(
            .top(imageView.bottomAnchor, constant: 24),
            .leading(containerView.leadingAnchor, constant: 16),
            .height(48)
        )

        cancelButton.widthAnchor
            .constraint(equalTo: deleteButton.widthAnchor)
            .isActive = true
    }
}

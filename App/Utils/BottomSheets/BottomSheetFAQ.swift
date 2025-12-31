//
//  BottomSheetFAQ.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

final class BottomSheetFAQ: UIViewController {
    private lazy var dimView = makeView(color: UIColor.black.withAlphaComponent(0.4), radius: 0, alpha: 0)
    private lazy var containerView = makeContainerView()
    private lazy var grabber = makeView(color: .systemGray3, radius: 2, alpha: 1)
    private lazy var titleLabel = makeLabel(text: "", textColor: .black, font: Typography.bold18.font, alignment: .center)
    private lazy var textLabel = makeLabel(text: "", textColor: .black, font: Typography.regular16.font, alignment: .left)
    private lazy var closeButton = makeCloseButton()
    private var containerBottomConstraint: NSLayoutConstraint?
    private let containerHeight: CGFloat = 320

    private var model: BottomSheetFAQModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstraints()
        setupGestures()
        animateShow()
    }
    
    func configure(_ model: BottomSheetFAQModel) {
        self.model = model
        titleLabel.text = model.title
        textLabel.text = model.text
    }
}

@objc
private extension BottomSheetFAQ {
    func closeButtonTapped() {
        dismissSheet()
    }

    func dismissSheet() {
        containerBottomConstraint?.constant = containerHeight
        UIView.animate(
            withDuration: 0.25,
            animations: {
                self.dimView.alpha = 0
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.dismiss(animated: false)
            }
        )
    }
}

private extension BottomSheetFAQ {
    func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissSheet))
        dimView.addGestureRecognizer(tap)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        containerView.addGestureRecognizer(pan)
    }

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        if translation.y > 0 {
            containerBottomConstraint?.constant = translation.y
        }
        if gesture.state == .ended {
            if translation.y > 120 {
                dismissSheet()
            } else {
                animateShow()
            }
        }
    }

    func animateShow() {
        containerBottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.dimView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
}

private extension BottomSheetFAQ {
    func setSubviews() {
        view.addSubview(dimView)
        view.addSubview(containerView)
        containerView.addSubview(grabber)
        containerView.addSubview(titleLabel)
        containerView.addSubview(textLabel)
        containerView.addSubview(closeButton)
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
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }

    func makeLabel(text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = alignment
        label.numberOfLines = 0
        return label
    }

    func makeCloseButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("ЗАКРЫТЬ", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.backgroundColor = Asset.Colors.d1D3D9.color
        button.layer.cornerRadius = 14
        button.titleLabel?.font = Typography.semibold14.font
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }
}

extension BottomSheetFAQ {
    func setConstraints() {
        dimView.fillSuperview()

        containerView.anchor(
            .leading(view.leadingAnchor),
            .trailing(view.trailingAnchor),
            .height(containerHeight)
        )

        containerBottomConstraint =
        containerView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: containerHeight
        )
        containerBottomConstraint?.isActive = true

        grabber.anchor(
            .top(containerView.topAnchor, constant: 8),
            .centerX(containerView.centerXAnchor),
            .width(40),
            .height(4)
        )

        titleLabel.anchor(
            .top(grabber.bottomAnchor, constant: 16),
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        textLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 12),
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16)
        )

        closeButton.anchor(
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16),
            .bottom(containerView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            .height(48)
        )
    }
}


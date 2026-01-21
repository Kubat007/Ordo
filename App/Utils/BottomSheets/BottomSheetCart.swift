//
//  BottomSheetCart.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 27/12/25.
//

import UIKit
import Kingfisher

struct BottomSheetCartModel {
    let title: String
    let price: String
    let currencyName: String
    let image: String?
    let count: Int
}

final class BottomSheetCart: UIViewController {
    private lazy var dimView = makeView(color: UIColor.black.withAlphaComponent(0.4), radius: 0, alpha: 0)
    private lazy var containerView = makeContainerView()
    private lazy var grabber = makeView(color: .systemGray3, radius: 2, alpha: 1)
    private lazy var titleMainLabel = makeLabel(text: "Укажите количество товаров", textColor: .black, font: Typography.bold14.font, alignment: .center)
    private lazy var imageView = makeImageView()
    private lazy var titleLabel = makeLabel(text: "Груша лесная красавица", textColor: .black, font: Typography.semibold16.font, alignment: .left)
    private lazy var priceLabel = makeLabel(text: "150.0 KGS", textColor: .black, font: Typography.semibold14.font, alignment: .left)
    private lazy var quantityLabel = makeLabel(text: "Количество:", textColor: .black, font: Typography.semibold16.font, alignment: .left)
    private lazy var minusButton = makeCounterButton(title: "–", action: #selector(minusButtonTapped))
    private lazy var countLabel = makeLabel(text: "3", textColor: .black, font: Typography.semibold16.font, alignment: .center)
    private lazy var plusButton = makeCounterButton(title: "+", action: #selector(plusButtonTapped))
    private lazy var addButton = makeAddButton()
    
    private var containerBottomConstraint: NSLayoutConstraint?
    private let containerHeight: CGFloat = 360
    private var model: BottomSheetCartModel?
    private var currentCount: Int = 1
    var onAddToCart: ((Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstraints()
        setupGestures()
        animateShow()
    }
}

private extension BottomSheetCart {
    func setSubviews() {
        view.addSubview(dimView)
        view.addSubview(containerView)
        containerView.addSubview(titleMainLabel)
        containerView.addSubview(grabber)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(quantityLabel)
        containerView.addSubview(minusButton)
        containerView.addSubview(countLabel)
        containerView.addSubview(plusButton)
        containerView.addSubview(addButton)
    }
}

extension BottomSheetCart {
    func configure(_ model: BottomSheetCartModel) {
        self.model = model
        titleLabel.text = model.title
        priceLabel.text = "\(model.price) \(model.currencyName)"
        imageView.kf.setImage(with: URL(string: model.image ?? ""))
        countLabel.text = "\(currentCount)"
    }
}

@objc
extension BottomSheetCart {
    func minusButtonTapped() {
        guard currentCount > 1 else { return }
        currentCount -= 1
        countLabel.text = "\(currentCount)"
//        onAddToCart?(currentCount)
    }
    
    func plusButtonTapped() {
        currentCount += 1
        countLabel.text = "\(currentCount)"
//        onAddToCart?(currentCount)
    }
    
    func addButtonTapped() {
        onAddToCart?(currentCount)
        dismiss(animated: true)
    }
}

private extension BottomSheetCart {
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
    
    @objc func dismissSheet() {
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

private extension BottomSheetCart {
    func makeView(color: UIColor, radius: CGFloat, alpha: CGFloat) -> UIView {
        let view = UIView()
        view.alpha = alpha
        view.layer.cornerRadius = radius
        view.backgroundColor = color
        return view
    }
    
    func makeContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.backgroundColor = .systemGray5
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }
    
    private func makeLabel(text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textAlignment = alignment
        label.numberOfLines = 0
        label.textColor = textColor
        label.font = font
        label.text = text
        return label
    }
    
    func makeCounterButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = Typography.semibold20.font
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func makeAddButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Добавить в корзину", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.10, green: 0.15, blue: 0.50, alpha: 1)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = Typography.bold16.font
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }
}

extension BottomSheetCart {
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
        
        titleMainLabel.anchor(
            .top(grabber.bottomAnchor, constant: 16),
            .centerX(containerView.centerXAnchor)
        )
        
        imageView.anchor(
            .top(titleMainLabel.bottomAnchor, constant: 16),
            .leading(containerView.leadingAnchor, constant: 16),
            .width(80),
            .height(80)
        )
        
        titleLabel.anchor(
            .top(imageView.topAnchor),
            .leading(imageView.trailingAnchor, constant: 12),
            .trailing(containerView.trailingAnchor, constant: 16)
        )
        
        priceLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 8),
            .leading(titleLabel.leadingAnchor)
        )
        
        quantityLabel.anchor(
            .top(imageView.bottomAnchor, constant: 32),
            .leading(containerView.leadingAnchor, constant: 16)
        )
        
        minusButton.anchor(
            .centerY(quantityLabel.centerYAnchor),
            .trailing(countLabel.leadingAnchor, constant: 12),
            .width(44),
            .height(44)
        )
        
        countLabel.anchor(
            .centerY(quantityLabel.centerYAnchor),
            .trailing(plusButton.leadingAnchor, constant: 12),
            .width(24)
        )
        
        plusButton.anchor(
            .centerY(quantityLabel.centerYAnchor),
            .trailing(containerView.trailingAnchor, constant: 16),
            .width(44),
            .height(44)
        )
        
        addButton.anchor(
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16),
            .bottom(containerView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            .height(56)
        )
    }
}

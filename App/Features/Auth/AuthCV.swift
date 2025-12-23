//
//  AuthCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

public final class AuthCV: UIView {
    private lazy var logoImageView = makeLogoImageView()
    private lazy var titleLabel = makeLabel(text: "Вход", textColor: Asset.Colors.black.color, font: Typography.semibold32.font)
    private lazy var phoneLabel = makeLabel(text: "Телефон", textColor: Asset.Colors.black.color, font: Typography.semibold16.font)
    private lazy var phoneCodeLabel = makeLabel(text: "+996", textColor: Asset.Colors.black.color, font: Typography.semibold14.font)
    private lazy var phoneContainer = makePhoneContainer()
    lazy var phoneTextField = makeInputField()
    lazy var termsCheckbox = makeCheckbox()
    private lazy var termsLabel = makeTermsLabel()
    lazy var loginButton = makeLoginButton()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setubTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setubTargets() {
        titleLabel.textAlignment = .center
    }
}

extension AuthCV: BaseCV {
    public func setSubviews() {
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(phoneLabel)
        addSubview(phoneContainer)
        phoneContainer.addSubview(phoneCodeLabel)
        phoneContainer.addSubview(phoneTextField)
        addSubview(termsCheckbox)
        addSubview(termsLabel)
        addSubview(loginButton)
    }
}

extension AuthCV {
    private func makeLogoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Asset.Images.ordoLogo.image
        return imageView
    }
    
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        return label
    }
    
    private func makePhoneContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }
    
    private func makeInputField() -> InputView {
        let field = InputView()
        field.labelsStackView.isHidden = true
        field.backgroundColor = .clear
        field.textField.backgroundColor = .clear
        field.textField.placeholder = "(000)-000-000"
        field.textField.font = Typography.regular16.font
        field.textField.textColor = Asset.Colors.black.color
        field.textField.borderColor = .lightGray
        field.textField.withKeyboard(for: .number)
        field.textField.addDoneToolbar()
        return field
    }
    
    private func makePhoneTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = "(000)-000-000"
        textField.font = Typography.regular16.font
        textField.textColor = .black
        textField.keyboardType = .phonePad
        textField.backgroundColor = .clear
        return textField
    }
    
    private func makeCheckbox() -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = UIColor(red: 0.10, green: 0.15, blue: 0.50, alpha: 1.00)
        return button
    }
    
    private func makeTermsLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        
        let text = "Согласен и ознакомлен с условиями сервиса"
        let attributedString = NSMutableAttributedString(string: text)
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: Typography.regular14.font
        ]
        let linkAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .font: Typography.regular14.font,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        attributedString.addAttributes(normalAttributes, range: NSRange(location: 0, length: text.count))
        if let range = text.range(of: "условиями сервиса") {
            let nsRange = NSRange(range, in: text)
            attributedString.addAttributes(linkAttributes, range: nsRange)
        }
        
        label.attributedText = attributedString
        return label
    }
    
    private func makeLoginButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("ВХОД", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.10, green: 0.15, blue: 0.50, alpha: 1.00)
        button.titleLabel?.font = Typography.bold16.font
        button.layer.cornerRadius = 12
        return button
    }
}

extension AuthCV {
    public func setConstraints() {
        logoImageView.anchor(
            .top(safeAreaLayoutGuide.topAnchor, constant: 80),
            .centerX(centerXAnchor),
            .width(120),
            .height(120)
        )
        
        titleLabel.anchor(
            .top(logoImageView.bottomAnchor, constant: 40),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        phoneLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 32),
            .leading(leadingAnchor, constant: 32)
        )
        
        phoneContainer.anchor(
            .top(phoneLabel.bottomAnchor, constant: 8),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32),
            .height(56)
        )
        
        phoneCodeLabel.anchor(
            .top(phoneContainer.topAnchor, constant: 4),
            .leading(phoneContainer.leadingAnchor, constant: 12),
            .trailingLessThanEqual(phoneContainer.centerXAnchor, constant: 0),
            .bottom(phoneContainer.bottomAnchor, constant: 4)
        )

        phoneCodeLabel.setContentHuggingPriority(.required, for: .horizontal)
        phoneCodeLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        phoneTextField.anchor(
            .top(phoneContainer.topAnchor, constant: 4),
            .leading(phoneCodeLabel.trailingAnchor, constant: 8),
            .trailing(phoneContainer.trailingAnchor, constant: 12),
            .bottom(phoneContainer.bottomAnchor, constant: 4)
        )
        
        termsCheckbox.anchor(
            .leading(leadingAnchor, constant: 32),
            .top(phoneContainer.bottomAnchor, constant: 24),
            .width(24),
            .height(24)
        )
        
        termsLabel.anchor(
            .leading(termsCheckbox.trailingAnchor, constant: 12),
            .trailing(trailingAnchor, constant: 16),
            .centerY(termsCheckbox.centerYAnchor)
        )
        
        loginButton.anchor(
            .top(termsCheckbox.bottomAnchor, constant: 32),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32),
            .height(56)
        )
    }
}

//
//  VerifyCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

public final class VerifyCV: UIView {
    private lazy var titleLabel = makeLabel(text: "Введите смс код", textColor: Asset.Colors.black.color, font: Typography.semibold32.font)
    private lazy var subtitleLabel = makeLabel(text: "На ваш номер выслан код\nдля активации вашего аккаунта", textColor: .gray, font: Typography.regular14.font)
    private lazy var codeStackView = makeCodeStackView()
    private lazy var timerLabel = makeLabel(text: "Повторный смс код через: 02:57 сек", textColor: .gray, font: Typography.regular14.font)
    lazy var confirmButton = makeConfirmButton()
    
    public var codeFields: [TextField] = []
    public var onCodeFilled: ((String) -> Void)?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setupUI()
        setupCodeFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.textAlignment = .center
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        timerLabel.textAlignment = .center
    }
    
    private func setupCodeFields() {
        for i in 0..<(codeFields.count - 1) {
            codeFields[i].nextTextfield = codeFields[i + 1]
        }
        
        codeFields.forEach { field in
            field.delegate = self
            field.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
        
        if let firstField = codeFields.first {
            firstField.textContentType = .oneTimeCode
            firstField.keyboardType = .numberPad
        }
    }
    
    public func getCode() -> String {
        return codeFields.compactMap { $0.text }.joined()
    }
    
    public func clearCode() {
        codeFields.forEach { $0.text = "" }
        codeFields.first?.becomeFirstResponder()
    }
}

extension VerifyCV: BaseCV {
    public func setSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(codeStackView)
        addSubview(timerLabel)
        addSubview(confirmButton)
    }
}

extension VerifyCV {
    private func makeLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        return label
    }
    
    private func makeCodeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        
        for i in 0..<4 {
            let codeField = makeCodeField(tag: i)
            codeFields.append(codeField)
            stack.addArrangedSubview(codeField)
        }
        return stack
    }
    
    private func makeCodeField(tag: Int) -> TextField {
        let textField = TextField(placeholder: "0")
        textField.tag = tag
        textField.textAlignment = .center
        textField.font = Typography.semibold32.font
        textField.textColor = Asset.Colors.black.color
        textField.borderWidth = 0
        textField.backgroundColor = .clear
        textField.with(textFieldType: .validationCode)
        textField.keyboardType = .numberPad
        textField.setPadding(.zero)
        let underline = UIView()
        underline.backgroundColor = .lightGray
        underline.tag = 100 + tag // Для идентификации
        textField.addSubview(underline)
        
        underline.anchor(
            .leading(textField.leadingAnchor),
            .trailing(textField.trailingAnchor),
            .bottom(textField.bottomAnchor),
            .height(1)
        )
        textField.addDoneToolbar()
        return textField
    }
    
    private func makeConfirmButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("ПОДТВЕРДИТЬ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(white: 0.6, alpha: 1)
        button.titleLabel?.font = Typography.bold16.font
        button.layer.cornerRadius = 12
        button.isEnabled = false
        return button
    }
}

// MARK: - Обработка ввода
extension VerifyCV {
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        guard let textField = textField as? TextField else { return }
        guard let text = textField.text else { return }
        let tag = textField.tag
        
        updateUnderline(for: textField)
        
        if !text.isEmpty && tag < codeFields.count - 1 {
            if text.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil {
                codeFields[tag + 1].becomeFirstResponder()
            }
        }
        checkCodeCompletion()
    }
    
    private func checkCodeCompletion() {
        let code = getCode()
        let isComplete = code.count == codeFields.count && code.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        
        confirmButton.isEnabled = isComplete
        confirmButton.backgroundColor = isComplete ? .systemBlue : UIColor(white: 0.6, alpha: 1)
        
        if isComplete {
            onCodeFilled?(code)
        }
    }
    
    private func updateUnderline(for textField: TextField) {
        if let underline = textField.viewWithTag(100 + textField.tag) {
            let isFocused = textField.isFirstResponder
            let hasText = !(textField.text?.isEmpty ?? true)
            
            if isFocused {
                underline.backgroundColor = Asset.Colors.black.color
                underline.heightAnchor.constraint(equalToConstant: 2).isActive = true
            } else if hasText {
                underline.backgroundColor = Asset.Colors.black.color
                underline.heightAnchor.constraint(equalToConstant: 1).isActive = true
            } else {
                underline.backgroundColor = .lightGray
                underline.heightAnchor.constraint(equalToConstant: 1).isActive = true
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension VerifyCV: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? TextField else { return }
        updateUnderline(for: textField)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textField = textField as? TextField else { return }
        updateUnderline(for: textField)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textField = textField as! TextField
        let tag = textField.tag
        
        if string.isEmpty {
            if textField.text?.isEmpty == true && tag > 0 {
                codeFields[tag - 1].becomeFirstResponder()
                codeFields[tag - 1].text = ""
            }
            return true
        }
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        guard allowedCharacters.isSuperset(of: characterSet) else {
            return false
        }
        
        guard let currentText = textField.text else { return true }
        let newLength = currentText.count + string.count - range.length
        if newLength > 1 {
            textField.text = string
            if tag < codeFields.count - 1 {
                codeFields[tag + 1].becomeFirstResponder()
            }
            checkCodeCompletion()
            return false
        }
        
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textField = textField as! TextField
        let tag = textField.tag
        
        if tag < codeFields.count - 1 {
            codeFields[tag + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            
            let code = getCode()
            if code.count == codeFields.count {
                onCodeFilled?(code)
            }
        }
        
        return true
    }
}

extension VerifyCV {
    public func setConstraints() {
        titleLabel.anchor(
            .top(safeAreaLayoutGuide.topAnchor, constant: 80),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 16),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        codeStackView.anchor(
            .top(subtitleLabel.bottomAnchor, constant: 40),
            .centerX(centerXAnchor),
            .width(200)
        )
        
        codeFields.forEach { field in
            field.anchor(.height(50))
        }
        
        timerLabel.anchor(
            .top(codeStackView.bottomAnchor, constant: 24),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        confirmButton.anchor(
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 32),
            .height(56)
        )
    }
}

// MARK: - Публичные методы
public extension VerifyCV {
    func startCodeInput() {
        codeFields.first?.becomeFirstResponder()
    }
    
    func updateTimer(seconds: Int) {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        timerLabel.text = String(format: "Повторный смс код через: %02d:%02d сек", minutes, remainingSeconds)
    }
    
    func showError() {
        codeFields.forEach { field in
            if let underline = field.viewWithTag(100 + field.tag) {
                underline.backgroundColor = .red
            }
        }
    }
    
    func hideError() {
        codeFields.forEach { field in
            updateUnderline(for: field)
        }
    }
}

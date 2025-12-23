//
//  TextField.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

// swiftlint:disable all
open class TextField: UITextField, Validable {
    private var padding: UIEdgeInsets = .init()
    
    // UI elements
    lazy var leadingButton = makeLeadingButton()
    private lazy var trailingButton = makeTrailingButton()
    private(set) var pickerView: UIPickerView!
    private(set) var datePickerView: UIDatePicker!
    
    // Properties
    public var isRequired = false
    private var clearButtonTapped = false
    public var isSelectionDisabled = false
    private var maskType: MaskedInputType?
    private var clearButtonEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
    private var validator: TextFieldValidatable?
    
    public var textfieldState: TextfieldState = .default {
        didSet {
            borderColor = textfieldState.borderColor
        }
    }
    
    public var nextTextfield: UIResponder? = nil {
        didSet {
            returnKeyType = nextTextfield == nil ? .done : .next
        }
    }
    
    public var isValid: Bool {
        let textIsEmpty = text?.isEmpty ?? false
        let requiredCondition = isRequired ? !textIsEmpty : true
        let condition = requiredCondition && textfieldState != .error
        textfieldState = condition ? .success : .error
        return condition
    }
    
    /// rawText is used for child classes which have this particular functionality with formatting and avoiding type casting
    public var rawText: String {
        guard let text = text else { return "" }
        return text
    }
    
    /// formattedText is used for child classes which have this particular functionality with formatting and avoiding type casting
    public var formattedText: String {
        return rawText
    }
    
    public init(placeholder: String = "", padding: UIEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 8), nextTextfield: UIResponder? = nil) {
        self.padding = padding
        self.nextTextfield = nextTextfield
        super.init(frame: .zero)
        self.trailingButton.isHidden = true
        self.autocorrectionType = .no
        self.delegate = self
        self.font = Typography.regular14.font
        self.textColor = Asset.Colors._232837.color
        self.contentVerticalAlignment = .center
        self.backgroundColor = .clear
        self.contentMode = contentMode
        self.cornerRadius = 4 * Constants.ScreenSizeConstant
        self.borderColor = textfieldState.borderColor
        self.borderWidth = 1
        self.autocapitalizationType = .sentences
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: Asset.Colors.d1D2D5.color,
                                                                    .font: Typography.regular14.font]
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        returnKeyType = nextTextfield == nil ? .done : .next
    }
    
    public required init?(coder aDecoder: NSCoder) {
        padding = .zero
        super.init(coder: aDecoder)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func becomeFirstResponder() -> Bool {
        if clearButtonTapped {
            clearButtonTapped = false
            return false
        }
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
    
    override open var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }
    
    open func setPadding(_ padding: UIEdgeInsets) {
        self.padding = padding
    }
    
    open func getPadding() -> UIEdgeInsets {
        return self.padding
    }
    
    override open func caretRect(for position: UITextPosition) -> CGRect {
        return isSelectionDisabled ? .zero : super.caretRect(for: position)
    }
    
    override open func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return isSelectionDisabled ? [] : super.selectionRects(for: range)
    }
    
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return isSelectionDisabled ? false : super.canPerformAction(action, withSender: sender)
    }
    
    open override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let bounds = super.clearButtonRect(forBounds: bounds)
        return bounds.inset(by: clearButtonEdgeInsets)
    }
}

extension TextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textfieldState = .focused
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard textfieldState == .focused else { return }
        textfieldState = .default
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextfield = nextTextfield {
            nextTextfield.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
        return true
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        clearButtonTapped = true
        return true
    }
}

public extension TextField {
    private func withValidation(_ type: TextFieldType) {
        validator = TextFieldVaildatorFactory.validator(for: type)
        addTarget(self, action: #selector(validate(sender:)), for: .editingChanged)
    }
    
    func setValidator(message: String) {
        validator?.error.message = message
    }
    
    func validate(onSuccess: (() -> Void)? = nil) {
        guard isValid else {
            showInvalidFieldPresentation()
            return
        }
        onSuccess?()
    }
    
    func showInvalidFieldPresentation() {
        shake()
        textfieldState = .error
    }
}

public extension TextField {
    func withKeyboard(for type: TextFieldType) {
        switch type {
        case .validationCode, .quantity, .zipCode, .number:
            keyboardType = .numberPad
        case .email:
            keyboardType = .emailAddress
            autocapitalizationType = .none
        case .amount:
            keyboardType = .decimalPad
        case .name:
            keyboardType = .alphabet
        case .password:
            autocapitalizationType = .none
        default:
            break
        }
    }
}

public extension TextField {
    func withFormatting(_ type: TextFieldType) {
        switch type {
        case .validationCode, .quantity, .zipCode, .number:
            break
        case .amount:
            break
        case .name:
            break
        default:
            break
        }
    }
}

public extension TextField {
    @discardableResult
    func with(textFieldType: TextFieldType, formatting: Bool = false, validation: Bool = false) -> TextField {
        withKeyboard(for: textFieldType)
        
        if formatting {
            withFormatting(textFieldType)
        }
        if validation {
            withValidation(textFieldType)
        }
        withTrailingButtonAction(type: textFieldType)
        return self
    }
}

public extension TextField {
    func withTrailingButtonAction(type: TextFieldType) {
        switch type {
        case .password:
            trailingButton.addTarget(self, action: #selector(passwordTrailingButtonAction), for: .touchUpInside)
        default:
            break
        }
    }
    
    func withTrailingIcon(image: UIImage, trailingConstant: CGFloat = 8, isUserInteractionEnabled: Bool = true) {
        addSubview(trailingButton)
        trailingButton.isUserInteractionEnabled = isUserInteractionEnabled
        trailingButton.anchor(
            .trailing(trailingAnchor, constant: trailingConstant),
            .top(topAnchor),
            .width(20),
            .bottom(bottomAnchor),
            .centerY(centerYAnchor)
        )
        
        padding.right += 8
        clearButtonEdgeInsets.right += padding.right / 2
        clearButtonEdgeInsets.left -= padding.right / 2
        trailingButton.setImage(image, for: .normal)
        trailingButton.isHidden = false
    }
    
    func withLeading(image: UIImage, leadingConstant: CGFloat = 8, isUserInteractionEnabled: Bool = true, isHidden: Bool = false) -> TextField {
        let imageSize = CGSize(width: 20, height: 20)
        addSubview(leadingButton)
        leadingButton.isUserInteractionEnabled = isUserInteractionEnabled
        leadingButton.anchor(
            .leading(leadingAnchor, constant: leadingConstant),
            .width(imageSize.width),
            .height(imageSize.height),
            .centerY(centerYAnchor)
        )
        padding.left += leadingConstant * 2
        leadingButton.setImage(image, for: .normal)
        leadingButton.isHidden = isHidden
        return self
    }
}

public extension TextField {
    @discardableResult
    func with(pickerView: UIPickerView) -> Self {
        self.pickerView = pickerView
        inputView = pickerView
        isSelectionDisabled = true
        tintColor = .clear
        return self
    }
    
    @discardableResult
    func with(datePicker: UIDatePicker) -> Self {
        self.datePickerView = datePicker
        inputView = datePickerView
        inputAccessoryView = nil
        isSelectionDisabled = true
        tintColor = .clear
        return self
    }
}

// MARK: Actions
private extension TextField {
    @objc func applyMask(_ sender: UITextField) {
        guard let maskType = maskType else { return }
        guard let text = sender.text else { return }
        let formattedText = InputFormatter.formatStringToMask(
            text: text,
            format: maskType.mask,
            minNumber: maskType.minLength,
            max: maskType.maxLength
        )
        
        self.text = formattedText.uppercased()
    }
    
    @objc func validate(sender: UITextField) {
        guard let text = sender.text,
              let validator = validator else { return }
        do {
            _ = try validator.validate(text)
            textfieldState = .success
        } catch {
            textfieldState = .error
        }
    }
    
    @objc func passwordTrailingButtonAction() {
        let eyeHidden = Asset.Images.eyeHidden.image
        let eye = Asset.Images.eye.image
        self.isSecureTextEntry.toggle()
        self.trailingButton.setImage(self.isSecureTextEntry ? eyeHidden : eye, for: .normal)
    }
}

// MARK: - UI factory methods
private extension TextField {
    func makeTrailingButton() -> UIButton {
        let button = UIButton()
        button.isHidden = true
        return button
    }
    
    func makeLeadingButton() -> UIButton {
        let button = UIButton()
        button.isHidden = true
        return button
    }
}

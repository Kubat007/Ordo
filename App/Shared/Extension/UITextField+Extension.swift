//
//  UITextField+Extension.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit
import AnyFormatKit

extension UITextField {
    func addDoneToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        self.resignFirstResponder()
    }
}

enum InputFormat {
    case phone
    case name
    case email
    case card
    case date
    case passport
    case custom(String)
    
    var pattern: String {
        switch self {
        case .phone: return "(###) ###-###"
        case .name: return "AAAAAAAAAAAAAAAAAAAA"
        case .card: return "#### #### #### ####"
        case .date: return "##/##/####"
        case .passport: return "AA ######"
        case .custom(let pattern): return pattern
        case .email: return ""
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .phone, .card, .passport, .date: return .numberPad
        case .name: return .alphabet
        case .email: return .emailAddress
        case .custom: return .default
        }
    }
}

// MARK: - Extension для UITextField
extension UITextField {
    private struct AssociatedKeys {
        static var formatterKey = "formatterKey"
        static var formatTypeKey = "formatTypeKey"
    }
    
    private var formatter: DefaultTextInputFormatter? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.formatterKey) as? DefaultTextInputFormatter }
        set { objc_setAssociatedObject(self, &AssociatedKeys.formatterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var formatType: InputFormat? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.formatTypeKey) as? InputFormat }
        set { objc_setAssociatedObject(self, &AssociatedKeys.formatTypeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func applyFormat(_ format: InputFormat) {
        self.formatType = format
        let oldDelegate = self.delegate
        if !format.pattern.isEmpty {
            self.formatter = DefaultTextInputFormatter(textPattern: format.pattern)
            let wrapperDelegate = TextFieldDelegateWrapper(
                formatter: formatter!,
                originalDelegate: oldDelegate
            )
            objc_setAssociatedObject(self, "wrapperDelegate", wrapperDelegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.delegate = wrapperDelegate
        }
        self.keyboardType = format.keyboardType
        if format.keyboardType == .numberPad {
            self.addDoneToolbar()
        }
    }
    
    func getCleanText() -> String {
        guard let text = self.text else { return "" }
        
        switch formatType {
        case .phone, .card, .date, .passport:
            return text.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        case .name:
            return text.replacingOccurrences(of: "[^a-zA-Zа-яА-Я ]", with: "", options: .regularExpression)
        default:
            return text
        }
    }
}

// MARK: - Делегат-обертка для сохранения оригинального делегата
class TextFieldDelegateWrapper: NSObject, UITextFieldDelegate {
    private let formatter: DefaultTextInputFormatter
    private weak var originalDelegate: UITextFieldDelegate?
    
    init(formatter: DefaultTextInputFormatter, originalDelegate: UITextFieldDelegate?) {
        self.formatter = formatter
        self.originalDelegate = originalDelegate
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = formatter.formatInput(
            currentText: textField.text ?? "",
            range: range,
            replacementString: string
        )
        textField.text = result.formattedText
        let caretPosition = textField.position(
            from: textField.beginningOfDocument,
            offset: result.caretBeginOffset
        )
        if let caretPosition = caretPosition {
            textField.selectedTextRange = textField.textRange(
                from: caretPosition,
                to: caretPosition
            )
        }
        return originalDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return originalDelegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        originalDelegate?.textFieldDidBeginEditing?(textField)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return originalDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        originalDelegate?.textFieldDidEndEditing?(textField)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return originalDelegate?.textFieldShouldClear?(textField) ?? true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return originalDelegate?.textFieldShouldReturn?(textField) ?? true
    }
}

extension UITextField {
    func setLeftPadding(_ padding: CGFloat) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = view
        leftViewMode = .always
    }
    
    func setRightPadding(_ padding: CGFloat) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        rightView = view
        rightViewMode = .always
    }
}

//
//  TextValidatorFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import Foundation

public protocol TextFieldValidatable {
    var error: TextFieldValidationError { get set }
    func validate(_ value: String) throws -> String
}

public enum TextFieldType: Equatable {
    case email
    case fullname
    case name
    case password
    case quantity
    case validationCode
    case zipCode
    case phoneNumber
    case number
    case amount(minAmount: Double = 0, maxAmount: Double = Double.greatestFiniteMagnitude, minAmountInvalidText: String = "", maxAmountInvalidText: String = "")
    case custom(regex: String)
}

public enum TextFieldVaildatorFactory {
    public static func validator(for type: TextFieldType, message: String = "") -> TextFieldValidatable {
        switch type {
        case .fullname:
            return FullnameValidator(error: .init(message))
        case .quantity:
            return QuantityValidator(error: .init(message))
        case .email:
            return EmailValidator(error: .init(message))
        case .name:
            return NameValidator(error: .init(message))
        case .password:
            return PasswordValidator(error: .init(message))
        case .validationCode:
            return ValidationCodeValidator(error: .init(message))
        case .zipCode:
            return ZipCodeValidator(error: .init(message))
        case .amount(let min, let max, let minText, let maxText):
            return AmountValidator(error: .init(message), minAmount: min, maxAmount: max, minAmountInvalidText: minText, maxAmountInvalidText: maxText)
        case .custom(let regex):
            return CustomValidator(regex: regex, error: .init(message))
        case .phoneNumber:
            return PhoneNumberValidator(error: .init(message))
        case .number:
            return NumberValidator(error: .init(message))
        }
    }
}

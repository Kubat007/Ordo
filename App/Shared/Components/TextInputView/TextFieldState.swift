//
//  TextFieldState.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

public enum TextfieldState {
    case `default`
    case focused
    case success
    case error
    public var borderColor: UIColor {
        switch self {
        case .default: return Asset.Colors.d1D2D5.color
        case .focused: return Asset.Colors.e5E5E5.color
        case .success: return Asset.Colors.d1D2D5.color
        case .error: return Asset.Colors.error.color
        }
    }
}

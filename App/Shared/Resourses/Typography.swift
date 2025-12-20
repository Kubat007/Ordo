import UIKit

public enum Typography {
    case bold12
    case bold14
    case bold16
    case bold18
    case bold20
    case bold24
    case bold32
    case semibold12
    case semibold13
    case semibold14
    case semibold15
    case semibold16
    case semibold17
    case semibold20
    case semibold32
    case medium11
    case medium12
    case medium13
    case medium14
    case medium16
    case regular10
    case regular12
    case regular14
    case regular16
    case regular20
    case regular24
    
    public var font: UIFont {
        switch self {
        case .bold12:
            return UIFont.systemFont(ofSize: 12.adaptToScreenSize, weight: .bold)
        case .bold14:
            return UIFont.systemFont(ofSize: 14.adaptToScreenSize, weight: .bold)
        case .bold16:
            return UIFont.systemFont(ofSize: 16.adaptToScreenSize, weight: .bold)
        case .bold18:
            return UIFont.systemFont(ofSize: 18.adaptToScreenSize, weight: .bold)
        case .bold20:
            return UIFont.systemFont(ofSize: 20.adaptToScreenSize, weight: .bold)
        case .bold24:
            return UIFont.systemFont(ofSize: 24.adaptToScreenSize, weight: .bold)
        case .bold32:
            return UIFont.systemFont(ofSize: 32.adaptToScreenSize, weight: .bold)
        case .semibold12:
            return UIFont.systemFont(ofSize: 12.adaptToScreenSize, weight: .semibold)
        case .semibold13:
            return UIFont.systemFont(ofSize: 13.adaptToScreenSize, weight: .semibold)
        case .semibold14:
            return UIFont.systemFont(ofSize: 14.adaptToScreenSize, weight: .semibold)
        case .semibold15:
            return UIFont.systemFont(ofSize: 15.adaptToScreenSize, weight: .semibold)
        case .semibold16:
            return UIFont.systemFont(ofSize: 16.adaptToScreenSize, weight: .semibold)
        case .semibold17:
            return UIFont.systemFont(ofSize: 17.adaptToScreenSize, weight: .semibold)
        case .semibold20:
            return UIFont.systemFont(ofSize: 20.adaptToScreenSize, weight: .semibold)
        case .semibold32:
            return UIFont.systemFont(ofSize: 32.adaptToScreenSize, weight: .semibold)
        case .medium11:
            return UIFont.systemFont(ofSize: 11.adaptToScreenSize, weight: .medium)
        case .medium12:
            return UIFont.systemFont(ofSize: 12.adaptToScreenSize, weight: .medium)
        case .medium13:
            return UIFont.systemFont(ofSize: 13.adaptToScreenSize, weight: .medium)
        case .medium14:
            return UIFont.systemFont(ofSize: 14.adaptToScreenSize, weight: .medium)
        case .medium16:
            return UIFont.systemFont(ofSize: 16.adaptToScreenSize, weight: .medium)
        case .regular10:
            return UIFont.systemFont(ofSize: 10.adaptToScreenSize, weight: .regular)
        case .regular12:
            return UIFont.systemFont(ofSize: 12.adaptToScreenSize, weight: .regular)
        case .regular14:
            return UIFont.systemFont(ofSize: 14.adaptToScreenSize, weight: .regular)
        case .regular16:
            return UIFont.systemFont(ofSize: 16.adaptToScreenSize, weight: .regular)
        case .regular20:
            return UIFont.systemFont(ofSize: 20.adaptToScreenSize, weight: .regular)
        case .regular24:
            return UIFont.systemFont(ofSize: 24.adaptToScreenSize, weight: .regular)
        }
    }
}

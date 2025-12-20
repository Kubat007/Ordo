import UIKit

enum Constants {
    static var ScreenSizeConstant: CGFloat {
        switch DeviceScreenSize.current {
        case .large:
            return 1.0
        case .normal:
            return 0.8
        case .small:
            return 0.7
        }
    }
    
    static var ScreenSizeFontConstant: CGFloat {
        switch DeviceScreenSize.current {
        case .large:
            return 1.0
        case .normal:
            return 0.9
        case .small:
            return 0.8
        }
    }
    
    enum UserDefaultsKeys {
        static let configurations = "Configurations"
    }
}

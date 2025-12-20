import UIKit

protocol BaseCV: UIView, ContentViewSetupable {
    func setProperties()
}

extension BaseCV {
    func setProperties() {
        backgroundColor = UIColor.white
    }
}

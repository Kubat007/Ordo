import Foundation
import UIKit

protocol ModuleBuilder {
    associatedtype ViewController
    func build() -> ViewController
}

public protocol ContentViewSetupable {
    func setSubviews()
    func setConstraints()
}

protocol ViewControlable: UIViewController {
    func setSubviews()
    func setConstraints()
}

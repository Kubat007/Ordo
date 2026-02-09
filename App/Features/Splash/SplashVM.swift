import Foundation

protocol SplashVMDelegate: AnyObject {
    func splashAnimationCompleted()
}

final class SplashVM {
    weak var delegate: SplashVMDelegate?
    
    func startLoading() {
    }
    
    func animationCompleted() {
        delegate?.splashAnimationCompleted()
    }
}

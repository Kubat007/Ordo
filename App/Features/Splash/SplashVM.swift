import Foundation

final class SplashVM {
    var onLoadingFinished: (() -> Void)?
    
    func startLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onLoadingFinished?()
        }
    }
}

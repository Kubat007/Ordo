final class SplashBuilder {
    static func build(onLoadingFinished: (() -> Void)? = nil) -> SplashVC {
        let viewModel = SplashVM()
        viewModel.onLoadingFinished = onLoadingFinished
        let viewController = SplashVC(viewModel: viewModel)
        return viewController
    }
}

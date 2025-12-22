import UIKit

class BaseVC<ContentView: BaseCV, ViewModel: BaseVM>: UIViewController, ViewControlable {
    let contentView: ContentView
    let viewModel: ViewModel
    var disposal = Disposal()
    
    private let activityIndicatorOverlayView = ActivityIndicatorOverlayView()
    
    init(contentView: ContentView, viewModel: ViewModel) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.baseDelegate = self
        contentView.setProperties()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstraints()
        setTargets()
        setLocalization(with: viewModel.strings.value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTargets() {}
    
    func setLocalization(with strings: AppModels.Response.Initialize) {}
    
    func setSubviews() {
        view.addSubview(contentView)
        view.backgroundColor = UIColor.white
    }
    
    func setConstraints() {
        contentView.anchor(
            .leading(view.leadingAnchor),
            .trailing(view.trailingAnchor),
            .top(view.topAnchor),
            .bottom(view.bottomAnchor)
        )
    }
    
    func showActivityIndicatorView() {
        view.addSubview(activityIndicatorOverlayView)
        
        changeInteractions(state: false)
        activityIndicatorOverlayView.frame = view?.frame ?? self.view.frame
        activityIndicatorOverlayView.anchor(
            .centerY(view?.centerYAnchor ?? self.view.centerYAnchor),
            .centerX(view?.centerXAnchor ?? self.view.centerXAnchor)
        )
        activityIndicatorOverlayView.show()
    }
    
    func hideActivityIndicatorView() {
        changeInteractions(state: true)
        activityIndicatorOverlayView.hide()
        activityIndicatorOverlayView.removeFromSuperview()
    }
    
    private func changeInteractions(state: Bool) {
        view.isUserInteractionEnabled = state
        navigationController?.navigationBar.isUserInteractionEnabled = state
    }
    
    func addConstantToHeightOfView(constant: CGFloat) {
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: view.frame.width,
                            height: UIScreen.main.bounds.height - UIDevice.current.getSafeAreaBottomInset() - UIDevice.current.getTabBarHeight() + constant)
    }
    
    func showErrorAlert(text: String) {
        let alertController = UIAlertController(title: "Упс",
                                                message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension BaseVC {
    func toast(with message: String, duration: Double = 5, messageType: Toast.MessageType, on position: Toast.Position = .top) {
        guard !message.isEmpty else { return }
        let toast = Toast(text: message, duration: duration)
        var backgroundColor: UIColor
        var iconImage: UIImage
        var titleLabelText: String
        switch messageType {
        case .success:
            backgroundColor = Asset.Colors.success.color
            iconImage = Asset.Images.toastSuccess.image
            titleLabelText = "Success" //L10n.Toast.Success.title.localized(by: viewModel.config.value)
        case .error:
            backgroundColor = Asset.Colors.error.color
            iconImage = Asset.Images.toastError.image
            titleLabelText = "Error" //L10n.Toast.Error.title.localized(by: viewModel.config.value)
        case .warning:
            backgroundColor = Asset.Colors.warning.color
            iconImage = Asset.Images.toastError.image
            titleLabelText = "Warning" //L10n.Toast.Warning.title.localized(by: viewModel.config.value)
        }
        toast.showToast(
            on: contentView,
            duration: duration,
            on: position,
            backgroundColor: backgroundColor,
            iconImage: iconImage,
            titleLabelText: titleLabelText
        )
    }
}

extension BaseVC: BaseVMDelegate {
    func viewModel(_ viewModel: BaseVM, didUpdateLoadingState state: LoadingState) {
        switch state {
        case .loaded:
            hideActivityIndicatorView()
        case .loading:
            showActivityIndicatorView()
        }
    }
}

import UIKit

final class SplashVC: UIViewController {
    private let viewModel: SplashVM
    
    init(viewModel: SplashVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.startLoading()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = "Splash Screen"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
    }
}

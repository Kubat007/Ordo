import UIKit
import Lottie

final class SplashVC: UIViewController {
    private let viewModel: SplashVM
    private let logo = UIImageView()
    private let animationView: LottieAnimationView
    
    init(viewModel: SplashVM) {
        self.viewModel = viewModel
        self.animationView = LottieAnimationView(name: "loading_anim_2")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        playAnimation()
        viewModel.startLoading()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFill
        logo.image = Asset.Images.ordoLogo.image
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logo)
        view.addSubview(animationView)
        
        animationView.anchor(
            .bottom(view.bottomAnchor, constant: 16),
            .leading(view.leadingAnchor, constant: 16),
            .trailing(view.trailingAnchor, constant: 16),
            .height(300)
        )
        
        logo.anchor(
            .bottom(animationView.topAnchor, constant: 32),
            .leading(view.leadingAnchor, constant: 16),
            .trailing(view.trailingAnchor, constant: 16),
            .height(200)
        )
    }
    
    private func playAnimation() {
        animationView.play { [weak self] finished in
            self?.viewModel.animationCompleted()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.animationView.animationSpeed = 2.0
        }
    }
    
    func fadeOut(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 0
        }) { _ in
            completion()
        }
    }
}

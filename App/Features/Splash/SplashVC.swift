import UIKit
import Lottie

final class SplashVC: UIViewController {
    private let viewModel: SplashVM
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
        
        // Настройка анимации
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func playAnimation() {
        animationView.play { [weak self] finished in
            // Когда анимация завершится
            self?.viewModel.animationCompleted()
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

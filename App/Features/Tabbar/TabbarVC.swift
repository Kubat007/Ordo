import UIKit

final class TabBarVC: UITabBarController, TabbarView {
    var onMainFlowSelect: ((BaseNC) -> Void)?
    var onFavoriteFlowSelect: ((BaseNC) -> Void)?
    var onProfileFlowSelect: ((BaseNC) -> Void)?
    var onMoreFlowSelect: ((BaseNC) -> Void)?
    var onProductListFlowSelect: ((BaseNC) -> Void)?
    
    private let services: Services
    
    init(services: Services) {
        self.services = services
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupMiddleButton()
        delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Запускаем основной поток при первом показе
        if let firstNav = viewControllers?.first as? BaseNC {
            onMainFlowSelect?(firstNav)
        }
    }
    
    private func setupAppearance() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .systemBackground
        
        tabBar.isTranslucent = true
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOpacity = 0.1
        
        tabBar.layer.borderWidth = 0
        tabBar.clipsToBounds = true
    }
    
    private func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 74, height: 74))
        
        middleButton.backgroundColor = .systemBlue
        middleButton.layer.cornerRadius = 37
        middleButton.layer.masksToBounds = false
        
        middleButton.layer.shadowColor = UIColor.systemBlue.cgColor
        middleButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        middleButton.layer.shadowRadius = 6
        middleButton.layer.shadowOpacity = 0.25
        
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold)
        let iconImage = UIImage(systemName: "list.bullet", withConfiguration: iconConfig)
        middleButton.setImage(iconImage, for: .normal)
        middleButton.tintColor = .white
        
        let tabBarTopY = tabBar.frame.origin.y
        middleButton.center = CGPoint(
            x: tabBar.center.x,
            y: tabBarTopY
        )
        middleButton.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)
        
        view.addSubview(middleButton)
        view.bringSubviewToFront(middleButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let middleButton = view.subviews.first(where: { $0 is UIButton }) as? UIButton {
            let tabBarTopY = tabBar.frame.origin.y
            
            middleButton.center = CGPoint(
                x: tabBar.center.x,
                y: tabBarTopY
            )
        }
    }
    
    @objc private func middleButtonTapped() {
        guard let selectedNav = selectedViewController as? BaseNC else { return }
        if let topVC = selectedNav.topViewController, topVC is ProductListVC {
            return
        }
        onProductListFlowSelect?(selectedNav)
        if let button = view.subviews.first(where: { $0 is UIButton }) as? UIButton {
            UIView.animate(withDuration: 0.1, animations: {
                button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }) { _ in
                UIView.animate(withDuration: 0.1) {
                    button.transform = .identity
                }
            }
        }
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        viewDidLayoutSubviews()
    }
}

extension TabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navController = viewController as? BaseNC else { return }
        switch tabBarController.selectedIndex {
        case 0:
            onMainFlowSelect?(navController)
        case 1:
            onFavoriteFlowSelect?(navController)
        case 3:
            onMoreFlowSelect?(navController)
        case 4:
            onProfileFlowSelect?(navController)
        default:
            break
        }
    }
}

import UIKit

final class TabBarVC: UITabBarController {
    private let services: ApiServices
    
    init(services: ApiServices) {
        self.services = services
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
        setupMiddleButton()
    }
    
    private func setupTabs() {
        // 5 табов как на скриншоте
        let mainVC = createNavController(
            title: "Главная",
            image: UIImage(systemName: "house.fill"),
            viewController: MainBuilder(services: services).build()
        )
        
        let favoritesVC = createNavController(
            title: "Избранное",
            image: UIImage(systemName: "heart.fill"),
            viewController: FavoriteBuilder(services: services).build()
        )
        
        // Пустой контроллер для средней кнопки
        let middleVC = UIViewController()
        middleVC.tabBarItem = UITabBarItem(title: "", image: nil, tag: 2)
        middleVC.tabBarItem.isEnabled = false // Отключаем стандартное нажатие
        
        let listVC = createNavController(
            title: "Список",
            image: UIImage(systemName: "list.bullet"),
            viewController: ProductListBuilder(services: services).build()
        )
        
        let profileVC = createNavController(
            title: "Профиль",
            image: UIImage(systemName: "person.fill"),
            viewController: createPlaceholderVC(title: "Профиль", color: .systemGreen)
        )
        
        let moreVC = createNavController(
            title: "Ещё",
            image: UIImage(systemName: "ellipsis"),
            viewController: createPlaceholderVC(title: "Ещё", color: .systemGray)
        )
        
        viewControllers = [mainVC, favoritesVC, middleVC, listVC, profileVC, moreVC]
        selectedIndex = 0 // Главная по умолчанию
    }
    
    private func setupAppearance() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .systemBackground
        
        // Делаем таббар полупрозрачным
        tabBar.isTranslucent = true
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        // Добавляем тень
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOpacity = 0.1
        
        // Убираем верхнюю линию
        tabBar.layer.borderWidth = 0
        tabBar.clipsToBounds = true
    }
    
    private func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 74, height: 74))
        
        // Настройка внешнего вида
        middleButton.backgroundColor = .systemBlue
        middleButton.layer.cornerRadius = 37
        middleButton.layer.masksToBounds = false
        
        // Тень для кнопки
        middleButton.layer.shadowColor = UIColor.systemBlue.cgColor
        middleButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        middleButton.layer.shadowRadius = 6
        middleButton.layer.shadowOpacity = 0.25
        
        // Иконка
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold)
        let iconImage = UIImage(systemName: "list.bullet", withConfiguration: iconConfig)
        middleButton.setImage(iconImage, for: .normal)
        middleButton.tintColor = .white
        
        // Размещаем кнопку на таббаре, но ВЫШЕ других элементов
        // Получаем Y-позицию верха таббара
        let tabBarTopY = tabBar.frame.origin.y
        
        middleButton.center = CGPoint(
            x: tabBar.center.x,
            y: tabBarTopY // Всего на 10 пикселей выше верха таббара
        )
        
        // Добавляем действие
        middleButton.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)
        
        // Добавляем на view контроллера
        view.addSubview(middleButton)
        view.bringSubviewToFront(middleButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Обновляем позицию средней кнопки
        if let middleButton = view.subviews.first(where: { $0 is UIButton }) as? UIButton {
            let tabBarTopY = tabBar.frame.origin.y
            
            middleButton.center = CGPoint(
                x: tabBar.center.x,
                y: tabBarTopY
            )
        }
    }
    
    @objc private func middleButtonTapped() {
        // Переключаемся на экран "Список" (третий таб)
        selectedIndex = 3 // Это индекс "Список" в массиве
        
        // Анимация нажатия
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
    
    private func createNavController(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let navController = BaseNC(rootViewController: viewController)
        navController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        
        // Настройка позиции заголовка
        navController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        
        return navController
    }
    
    private func createPlaceholderVC(title: String, color: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = color
        
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.frame = vc.view.bounds
        vc.view.addSubview(label)
        
        return vc
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        viewDidLayoutSubviews() // Обновляем при изменении safe area
    }
}

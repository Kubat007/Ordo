//
//  CustomTabbar.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

// CustomTabBar.swift
import UIKit

protocol CustomTabBarDelegate: AnyObject {
    func middleButtonTapped()
}

final class CustomTabBar: UITabBar {
    weak var customDelegate: CustomTabBarDelegate?
    
    private let middleButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMiddleButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMiddleButton()
    }
    
    private func setupMiddleButton() {
        // Настройка кнопки
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
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)
        
        addSubview(middleButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Позиционируем кнопку поверх таббара
        middleButton.frame = CGRect(x: (bounds.width - 74) / 2,
                                  y: -37,  // Половина выступает над таббаром
                                  width: 74,
                                  height: 74)
    }
    
    @objc private func middleButtonAction() {
        customDelegate?.middleButtonTapped()
    }
    
    // Ключевой момент: кнопка скрывается вместе с таббаром!
    override var isHidden: Bool {
        didSet {
            middleButton.isHidden = isHidden
        }
    }
    
    override var alpha: CGFloat {
        didSet {
            middleButton.alpha = alpha
        }
    }
}

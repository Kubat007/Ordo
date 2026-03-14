//
//  YandexMapCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/3/26.
//

import UIKit
import YandexMapsMobile

public final class YandexMapCV: UIView {

    lazy var navigationBar = makeNavigationBar()
    lazy var mapView = YMKMapView()
    
    lazy var searchTextField = makeSearchTextField()
    lazy var locationButton = makeLocationButton()
    lazy var searchButton = makeSearchButton()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) { fatalError() }
}

extension YandexMapCV: BaseCV {

    public func setSubviews() {
        addSubview(mapView)
        addSubview(navigationBar)
        addSubview(searchTextField)
        addSubview(locationButton)
        addSubview(searchButton)
    }
}

extension YandexMapCV {

    private func makeNavigationBar() -> CustomNavigationBar {
        let nav = CustomNavigationBar(style: .small)
        nav.backgroundColor = .white
        nav.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
        return nav
    }
    
    private func makeSearchTextField() -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        tf.leftViewMode = .always
        tf.returnKeyType = .search
        tf.clearButtonMode = .whileEditing
        
        tf.attributedPlaceholder = NSAttributedString(
            string: "Введите адрес или место",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
        
        return tf
    }
    
    private func makeLocationButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }
    
    private func makeSearchButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle("Найти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }
}

extension YandexMapCV {
    public func setConstraints() {
        mapView.anchor(
            .top(topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )

        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )

        searchTextField.anchor(
            .top(navigationBar.bottomAnchor, constant: 12),
            .leading(leadingAnchor, constant: 16),
            .trailing(searchButton.leadingAnchor),
            .height(44)
        )
        
        searchButton.anchor(
            .centerY(searchTextField.centerYAnchor),
            .trailing(trailingAnchor, constant: 16),
            .width(60),
            .height(44)
        )
        
        locationButton.anchor(
            .trailing(trailingAnchor, constant: 16),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: -20),
            .width(50),
            .height(50)
        )
    }
}

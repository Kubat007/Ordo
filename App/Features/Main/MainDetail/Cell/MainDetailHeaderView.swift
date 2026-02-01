//
//  MainDetailHeaderView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/1/26.
//

import UIKit

final class MainDetailHeaderView: UICollectionReusableView, ReusableView {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let dateLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = Typography.bold12.font
        l.backgroundColor = .clear
        return l
    }()
    
    private var initialHeight: CGFloat = 340
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    private func setup() {
        backgroundColor = .clear
        clipsToBounds = true
        
        addSubview(imageView)
        addSubview(dateLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 280), // Фиксированная высота картинки
            
            dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        dateLabel.isHidden = false
    }
    
    // MARK: - Configuration
    func configure(_ images: [MainModels.Response.Images_gallery], model: MainModels.Response.Products) {
        guard let first = images.first,
              let url = URL(string: first.image) else {
            imageView.backgroundColor = .lightGray
            return
        }
        imageView.kf.setImage(with: url)
        dateLabel.text = model.city_name
    }
    
    // MARK: - ✅ ДОБАВЛЯЕМ ЭТОТ МЕТОД!
    func updateForScroll(offset: CGFloat) {
        let maxHeight: CGFloat = 340
        let minHeight: CGFloat = 80
        
        // Вычисляем новую высоту
        let newHeight = max(maxHeight - offset, minHeight)
        
        // Изменяем масштаб imageView
        let scale = newHeight / maxHeight
        imageView.transform = CGAffineTransform(scaleX: 1.0, y: scale)
        
        // Закругляем углы при уменьшении
        let progress = 1 - (newHeight - minHeight) / (maxHeight - minHeight)
        layer.cornerRadius = 12 * progress
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    // MARK: - Сброс
    func reset() {
        UIView.animate(withDuration: 0.3) {
            self.imageView.transform = .identity
            self.layer.cornerRadius = 0
        }
    }
}

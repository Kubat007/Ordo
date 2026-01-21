//
//  BottomSheetCalendar.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 19/1/26.
//

import UIKit

final class DatePickerSheet: UIViewController {
    
    private lazy var dimView = UIView()
    private lazy var containerView = UIView()
    private lazy var datePicker = UIDatePicker()
    private lazy var titleLabel = UILabel()
    private lazy var doneButton = UIButton()
    private lazy var cancelButton = UIButton()
    
    var onDateSelected: ((Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        animateShow()
    }
    
    private func setupUI() {
        view.backgroundColor = Asset.Colors._232837.color
        
        dimView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        dimView.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissSheet))
        dimView.addGestureRecognizer(tap)
        
        containerView.backgroundColor = Asset.Colors._2E3446.color
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        titleLabel.text = "Выберите дату доставки"
        titleLabel.font = Typography.semibold16.font
        titleLabel.textAlignment = .center
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.minimumDate = Date()
        
        doneButton.setTitle("Выбрать", for: .normal)
        doneButton.backgroundColor = Asset.Colors._4986Ff.color
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.layer.cornerRadius = 12
        doneButton.titleLabel?.font = Typography.bold16.font
        doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.setTitleColor(.systemGray, for: .normal)
        cancelButton.titleLabel?.font = Typography.regular16.font
        cancelButton.addTarget(self, action: #selector(dismissSheet), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        view.addSubview(dimView)
        view.addSubview(containerView)
        
        dimView.fillSuperview()
        
        containerView.anchor(
            .leading(view.leadingAnchor),
            .trailing(view.trailingAnchor),
            .bottom(view.bottomAnchor)
        )
        
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            datePicker,
            doneButton,
            cancelButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        
        containerView.addSubview(stackView)
        
        stackView.anchor(
            .top(containerView.topAnchor, constant: 24),
            .leading(containerView.leadingAnchor, constant: 16),
            .trailing(containerView.trailingAnchor, constant: 16),
            .bottom(containerView.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        )
        
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func doneTapped() {
        onDateSelected?(datePicker.date)
        dismiss(animated: true)
    }
    
    @objc private func dismissSheet() {
        UIView.animate(withDuration: 0.3, animations: {
            self.dimView.alpha = 0
            self.containerView.transform = CGAffineTransform(translationX: 0, y: 400)
        }) { _ in
            self.dismiss(animated: false)
        }
    }
    
    private func animateShow() {
        containerView.transform = CGAffineTransform(translationX: 0, y: 400)
        
        UIView.animate(withDuration: 0.3) {
            self.dimView.alpha = 1
            self.containerView.transform = .identity
        }
    }
}

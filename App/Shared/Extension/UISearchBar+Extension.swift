//
//  UISearchBar+Extension.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/12/25.
//

import UIKit

extension UISearchBar {
    func removeBackgroundView() {
        if let backgroundView = self.subviews.first?.subviews.first(where: {
            String(describing: type(of: $0)).contains("Background")
        }) {
            backgroundView.backgroundColor = .clear
            backgroundView.isHidden = true
        }
        
        // Для iOS 13+
        if #available(iOS 13.0, *) {
            // Ищем в subviews searchTextField
            for subview in searchTextField.subviews {
                if String(describing: type(of: subview)).contains("Background") {
                    subview.backgroundColor = .clear
                    subview.isHidden = true
                }
            }
        }
    }
}

extension UISearchBar {
    func addDoneToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.isTranslucent = true
        toolbar.tintColor = .darkGray
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = toolbar
        
        // Также нужно настроить searchTextField
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.inputAccessoryView = toolbar
        }
    }
    
    @objc private func doneButtonTapped() {
        self.resignFirstResponder()
    }
}

extension UISearchBar {
    func addFilterButton(image: UIImage?, target: Any, action: Selector) {
        // Создаем кнопку фильтра
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(image, for: .normal)
        filterButton.tintColor = .gray // или нужный вам цвет
        filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        filterButton.addTarget(target, action: action, for: .touchUpInside)
        filterButton.isHidden = false // Всегда видна
        
        if #available(iOS 13.0, *) {
            // Получаем доступ к текстовому полю
            let searchTextField = self.searchTextField
            
            // Создаем контейнер для кнопки
            let filterButtonContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
            filterButton.frame = CGRect(x: 5, y: 0, width: 30, height: 30)
            filterButtonContainer.addSubview(filterButton)
            
            // Устанавливаем rightView
            searchTextField.rightView = filterButtonContainer
            searchTextField.rightViewMode = .always // Всегда показываем
            
            // Добавляем наблюдение за изменениями текста
            NotificationCenter.default.addObserver(
                forName: UITextField.textDidChangeNotification,
                object: searchTextField,
                queue: .main
            ) { [weak self] _ in
                // Можно обновлять состояние кнопки если нужно
                filterButton.isHidden = false // Всегда видна
            }
            
        } else {
            // Для iOS < 13
            if let textField = self.value(forKey: "searchField") as? UITextField {
                let filterButtonContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
                filterButton.frame = CGRect(x: 5, y: 0, width: 30, height: 30)
                filterButtonContainer.addSubview(filterButton)
                
                textField.rightView = filterButtonContainer
                textField.rightViewMode = .always
            }
        }
    }
    
    func updateFilterButtonVisibility(isHidden: Bool) {
        if #available(iOS 13.0, *) {
            self.searchTextField.rightView?.isHidden = isHidden
        } else {
            if let textField = self.value(forKey: "searchField") as? UITextField {
                textField.rightView?.isHidden = isHidden
            }
        }
    }
}

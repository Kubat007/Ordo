// CustomSearchView.swift
import UIKit

final class CustomSearchView: UIView {
    let textField = UITextField()
    let cancelButton = UIButton(type: .system)
    let searchIcon = UIImageView()
    
    var onTextChanged: ((String) -> Void)?
    var onCancelTapped: (() -> Void)?
    var onSearchTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        textField.placeholder = "Поиск..."
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.leftViewMode = .always
        textField.returnKeyType = .search
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont.systemFont(ofSize: 16)
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        searchIcon.tintColor = .gray
        leftView.addSubview(searchIcon)
        searchIcon.center = leftView.center
        textField.leftView = leftView
        
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        cancelButton.isHidden = true
        
        addSubview(textField)
        addSubview(cancelButton)
        setupConstraints()
        setupTargets()
    }
    
    private func setupConstraints() {
        textField.anchor(
            .leading(leadingAnchor, constant: 16),
            .top(topAnchor),
            .bottom(bottomAnchor),
            .trailing(cancelButton.leadingAnchor, constant: 8)
        )
        
        cancelButton.anchor(
            .trailing(trailingAnchor, constant: 16),
            .centerY(textField.centerYAnchor),
            .width(60)
        )
    }
    
    private func setupTargets() {
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.delegate = self
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldDidChange() {
        onTextChanged?(textField.text ?? "")
    }
    
    @objc private func cancelButtonTapped() {
        onCancelTapped?()
    }
    
    func activateSearch() {
        textField.becomeFirstResponder()
        cancelButton.isHidden = false
    }
    
    func deactivateSearch() {
        textField.resignFirstResponder()
        textField.text = ""
        cancelButton.isHidden = true
        onTextChanged?("")
    }
}

extension CustomSearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onSearchTapped?()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            cancelButton.isHidden = true
        }
    }
}

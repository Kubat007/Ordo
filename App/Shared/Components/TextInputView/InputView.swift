//
//  InputView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

final class InputView: UIView, ContentViewSetupable {
    lazy var titleLabel = makeTitleLabel()
    lazy var textField = makeTextField()
    lazy var descriptionButton = makeDescriptionButton()
    lazy var labelsStackView = makeLabelsStackView()
    lazy var mainStackView = makeMainStackView()
    
    var titleText: String {
        return titleLabel.text?.replacingOccurrences(of: " *", with: "") ?? ""
    }
    
    var textfieldConstraints: AnchoredConstraints?
    
    init(isHidden: Bool = false) {
        super.init(frame: .zero)
        self.isHidden = isHidden
        setSubviews()
        setConstraints()
    }
    
    func setTitle(_ text: String, isRequired: Bool = false) {
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: Asset.Colors._232837.color,
            NSAttributedString.Key.font: Typography.regular14.font
        ]
        let requiredTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: Typography.regular14.font
        ]
        
        let combination = NSMutableAttributedString()
        combination.append(NSMutableAttributedString(string: text, attributes: titleAttributes as [NSAttributedString.Key: Any]))
        if isRequired {
            combination.append(NSMutableAttributedString(string: " *", attributes: requiredTextAttributes as [NSAttributedString.Key: Any]))
        }
        
        titleLabel.attributedText = combination
    }
    
    func setSubviews() {
        addSubview(mainStackView)
        mainStackView.fillSuperview()
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionButton)
        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(textField)
    }
    
    func setConstraints() {
        labelsStackView.constrainHeight(16)
        mainStackView.spacing = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension InputView {
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    func makeTextField() -> TextField {
        let textField = TextField()
        return textField
    }
    
    func makeLabelsStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    func makeDescriptionButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(Asset.Colors.d1D2D5.color, for: .normal)
        button.isHidden = true
        button.contentHorizontalAlignment = .right
        return button
    }
    
    func makeHStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    func makeMainStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }
}

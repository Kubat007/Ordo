//
//  CustomNavigationBar.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import Foundation
import UIKit

public enum NavigationBarStyle {
    case large
    case small
    case stork
    case noContent
}

open class CustomNavigationBar: UIView {
    public lazy var backgroundView = makeBackgroundView()
    public lazy var titleLabel = makeTitleLabel()
    public lazy var leftButton = makeLeftButton()
    public lazy var rightButton = makeRightButton()
    public lazy var rightSecondButton = makeRightButton()
    
    private var heightConstraint: AnchoredConstraints?
    private var titleBottomConstraint: AnchoredConstraints?
    
    private let titleBottomConstraintSmallStork: CGFloat = 12 * Constants.ScreenSizeConstant
    private let titleBottomConstraintLargeEight: CGFloat = 8 * Constants.ScreenSizeConstant
    private let titleBottomConstraintLargeFour: CGFloat = 4 * Constants.ScreenSizeConstant
    
    private let buttonWidthHeight: CGFloat = 40 * Constants.ScreenSizeConstant
    private let viewLeadingTrailing: CGFloat = 8 * Constants.ScreenSizeConstant
    
    private let navbarSmallHeight: CGFloat = 48 * Constants.ScreenSizeConstant
    private let navbarStorkHeight: CGFloat = 66 * Constants.ScreenSizeConstant
    private let navbarLargeHeight: CGFloat = 96 * Constants.ScreenSizeConstant
    
    public var style: NavigationBarStyle = .small
    
    public var height: CGFloat = 0 {
        didSet {
            updateHeight()
        }
    }
    
    public init(style: NavigationBarStyle) {
        super.init(frame: CGRect.zero)
        self.style = style
        
        setSubviews()
        setConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        style = .small
        
        setSubviews()
        setConstraints()
    }
    
    private func updateStyle() {
        switch style {
        case .small:
            height = navbarSmallHeight
            titleBottomConstraint?.bottom?.constant = titleBottomConstraintSmallStork
        case .stork:
            height = navbarStorkHeight
            titleBottomConstraint?.bottom?.constant = titleBottomConstraintSmallStork
        case .large:
            if UIApplication.shared.statusBarFrame.height == 44 {
                titleBottomConstraint?.bottom?.constant = titleBottomConstraintLargeEight
            } else {
                titleBottomConstraint?.bottom?.constant = titleBottomConstraintLargeFour
            }
            height = navbarLargeHeight
        case .noContent:
            height = 0
        }
        
        updateConstraints()
    }
    
    private func updateHeight() {
        heightConstraint = self.anchor(.height(height))
        updateConstraints()
    }
}

extension CustomNavigationBar {
    private func setSubviews() {
        addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(leftButton)
        backgroundView.addSubview(rightButton)
        backgroundView.addSubview(rightSecondButton)
        
        updateStyle()
        updateHeight()
    }
    
    private func setConstraints() {
        backgroundView.anchor(
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor),
            .top(safeAreaLayoutGuide.topAnchor)
        )
        
        titleLabel.anchor(
            .centerX(backgroundView.centerXAnchor),
            .centerY(backgroundView.centerYAnchor),
            .leading(leftButton.trailingAnchor)
        )
        
        leftButton.anchor(
            .leading(backgroundView.leadingAnchor, constant: viewLeadingTrailing),
            .width(buttonWidthHeight),
            .centerY(backgroundView.centerYAnchor),
            .height(buttonWidthHeight)
        )
        
        rightButton.anchor(
            .trailing(backgroundView.trailingAnchor, constant: viewLeadingTrailing),
            .width(buttonWidthHeight),
            .centerY(backgroundView.centerYAnchor),
            .height(buttonWidthHeight)
        )
        
        rightSecondButton.anchor(
            .trailing(rightButton.leadingAnchor),
            .width(buttonWidthHeight),
            .centerY(backgroundView.centerYAnchor),
            .height(buttonWidthHeight)
        )
    }
}

extension CustomNavigationBar {
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Typography.bold16.font
        return label
    }
    
    func makeBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = Asset.Colors.white.color
        return view
    }
    
    func makeLeftButton() -> UIButton {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        return button
    }
    
    func makeRightButton() -> UIButton {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        return button
    }
}

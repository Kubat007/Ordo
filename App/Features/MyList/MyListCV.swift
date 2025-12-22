import UIKit

public final class MyListCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setSubviews() {
        addSubview(navigationBar)
    }
}

extension MyListCV {
    func makeNavigationBar() -> CustomNavigationBar {
        let navbar = CustomNavigationBar(style: .small)
        navbar.leftButton.setImage(Asset.Images.navBackButton.image, for: .normal)
//        navbar.backgroundView.backgroundColor = Asset.Colors.f7F7Fe.color
        navbar.backgroundView.backgroundColor = .clear
        return navbar
    }
}

extension MyListCV: BaseCV {
    public func setConstraints() {
        navigationBar.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
    }
}


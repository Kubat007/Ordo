import UIKit

public final class MyListCV: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension MyListCV: BaseCV {
    public func setConstraints() {
    }
    
    public func setSubviews() {
    }
}


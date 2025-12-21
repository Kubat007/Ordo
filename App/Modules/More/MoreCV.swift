//
//  MoreCV.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

public final class MoreCV: UIView {
    
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
extension MoreCV: BaseCV {
    public func setConstraints() {
    }
    
    public func setSubviews() {
    }
}

import UIKit

public extension UIView {
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @objc
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func addShadow(backgroundColor: UIColor, offset: CGSize, opacity: CGFloat, radius: CGFloat) {
        layer.shadowColor = backgroundColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = Float(opacity)
        layer.shadowRadius = radius
    }
    
    func dropShadow(color: UIColor, opacity: Float = 1, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
    
    func shake(count: Float? = nil, for duration: TimeInterval? = nil, withTranslation translation: Float? = nil) {
        let defaultRepeatCount: Float = 2.0
        let defaultTotalDuration = 0.15
        let defaultTranslation = -10
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        animation.repeatCount = count ?? defaultRepeatCount
        animation.duration = (duration ?? defaultTotalDuration) / TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? defaultTranslation
        layer.add(animation, forKey: "shake")
    }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor, startPoint: CGPoint = CGPoint(x: 0, y: 0), endPoint: CGPoint = CGPoint(x: 0, y: 0.5)) {
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.name = "gradientedCell"
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func roundSpecificCorners(corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if corners.contains(.layerMinXMinYCorner) {
                cornerMask.insert(.topLeft)
            }
            if corners.contains(.layerMaxXMinYCorner) {
                cornerMask.insert(.topRight)
            }
            if corners.contains(.layerMinXMaxYCorner) {
                cornerMask.insert(.bottomLeft)
            }
            if corners.contains(.layerMaxXMaxYCorner) {
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        
        //    layerMaxXMaxYCorner - bottom right corner
        //    layerMaxXMinYCorner - top right corner
        //    layerMinXMaxYCorner - bottom left corner
        //    layerMinXMinYCorner - top left corner
        
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        layer.add(rotateAnimation, forKey: nil)
    }
    
    func bounceAnimation(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.3, 0.8, 1.15, 0.9, 1.0]
        bounceAnimation.duration = duration
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        if let delegate: AnyObject = completionDelegate {
            bounceAnimation.delegate = delegate as? CAAnimationDelegate
        }
        layer.add(bounceAnimation, forKey: nil)
    }
    
    func flipFromBottomAnimation(duration: CFTimeInterval = 1.0) {
        UIView.transition(with: self,
                          duration: duration,
                          options: .transitionFlipFromBottom,
                          animations: nil,
                          completion: nil)
    }
    
    func shake(delegate: CAAnimationDelegate) {
       let animationKeyPath = "transform.translation.x"
       let shakeAnimation = "shake"
       let duration = 0.5
       let animation = CAKeyframeAnimation(keyPath: animationKeyPath)
       animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
       animation.duration = duration
       animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0]
       animation.delegate = delegate
       layer.add(animation, forKey: shakeAnimation)
    }
    
    func allSubviews() -> [UIView] {
       var subviews = [UIView]()
       subviews.append(self)
       self.subviews.forEach { view in
          subviews.append(contentsOf: view.allSubviews())
       }
       return subviews
    }
    
    func takeScreenshot() -> UIImage {
       return UIGraphicsImageRenderer(size: bounds.size).image { _ in
          drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
       }
    }
}

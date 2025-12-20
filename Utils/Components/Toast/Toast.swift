import UIKit

public class Toast: NSObject {
    static let tag = 228
    public enum Position {
        case top
        case middle
        case bottom
    }
    
    public enum MessageType {
        case success
        case error
        case warning
    }
    
    let toast: ToastView
    let duration: TimeInterval
    
    private var leadingConstraint: NSLayoutConstraint? {
        didSet {
            leadingConstraint?.isActive = true
        }
    }
    
    public init(text: String, duration: TimeInterval = 10.0) {
        self.toast = ToastView(frame: .zero, text: text)
        self.toast.tag = Toast.tag
        self.duration = duration
    }
    
    private func setSwipe() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwiped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        toast.addGestureRecognizer(swipeRight)
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        tapGesture.numberOfTouchesRequired = 1
        toast.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didTap(gesture: UITapGestureRecognizer) {
        guard let toastSuperView = toast.superview else { return }
        hide(after: 0, for: toastSuperView)
    }
    
    @objc
    private func didSwiped(gesture: UISwipeGestureRecognizer) {
        guard let toastSuperView = toast.superview else { return }
        
        if gesture.direction == .right {
            hide(after: 0, for: toastSuperView)
        }
    }
    
    public func showToast(
        on view: UIView,
        duration: Double = 10.0,
        on position: Position,
        backgroundColor: UIColor,
        iconImage: UIImage,
        titleLabelText: String
    ) {
        DispatchQueue.main.async {
            guard let window = view.window else { return }
            self.removePastToastIfNeeded(from: window)
            self.setSwipe()
            self.setTapGesture()
            self.toast.backgroundColor = backgroundColor
            self.toast.iconImageView.image = iconImage
            self.toast.titleLabel.text = titleLabelText
            self.setPosition(of: self.toast, on: window, position: position)
            self.animate(constant: 20, inside: window) { _ in
                self.showProgress(duration: duration)
                self.hide(after: duration, for: window)
            }
        }
    }
    
    private func removePastToastIfNeeded(from view: UIView) {
        view.viewWithTag(Toast.tag)?.removeFromSuperview()
    }

    private func hide(after duration: Double, for view: UIView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.animate(constant: UIScreen.main.bounds.width, inside: view) { _ in
                self.toast.removeFromSuperview()
            }
        }
    }
    
    private func setPosition(of toast: ToastView, on view: UIView, position: Position) {
        toast.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toast)
        
        switch position {
        case .top:
            toast.topAnchor.constraint(equalTo: view.topAnchor, constant: UIApplication.shared.statusBarFrame.size.height).isActive = true
        case .middle:
            toast.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        case .bottom:
            toast.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        }
        
        leadingConstraint = toast.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width)
        toast.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        view.layoutIfNeeded()
    }
    
    private func showProgress(duration: Double) {
        toast.progressView.progress = 0
        UIView.animate(withDuration: duration) { [weak self] in
            self?.toast.progressView.setProgress(1, animated: true)
        }
    }
    
    private func animate(constant: CGFloat, inside view: UIView, complition: @escaping (Bool) -> Void) {
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.leadingConstraint?.constant = constant
                view.layoutIfNeeded()
            },
            completion: complition
        )
    }
}

import UIKit

public class EmptyPlaceholderView: UIView {
    public enum State {
        case hidden
        case visible
    }
    
    public lazy var emptyBoxImageView = makeEmptyBoxImageView()
    public lazy var titleLabel = makeTitleLabel()
    public lazy var subtitleLabel = makeSubtitleLabel()
    public lazy var actionButton = makeActionButton()
    
    private let emptyBoxImageViewHeight: CGFloat = 160 * Constants.ScreenSizeConstant
    private let emptyBoxImageViewWidth: CGFloat = 200 * Constants.ScreenSizeConstant
    private let emptyBoxImageViewCenterY: CGFloat = 80 * Constants.ScreenSizeConstant
    private let titleLabelTop: CGFloat = 12 * Constants.ScreenSizeConstant
    private let actionButtonTop: CGFloat = 8 * Constants.ScreenSizeConstant
    private let titleLabelLeadingTrailing: CGFloat = 48 * Constants.ScreenSizeConstant
    
    public init() {
        super.init(frame: .zero)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyPlaceholderView {
    public func setSubviews() {
        addSubview(emptyBoxImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
    }
    
    public func setConstraints() {
        emptyBoxImageView.anchor(
            .centerY(centerYAnchor, constant: -emptyBoxImageViewCenterY),
            .centerX(centerXAnchor),
            .height(emptyBoxImageViewHeight),
            .width(emptyBoxImageViewWidth)
        )
        
        titleLabel.anchor(
            .top(emptyBoxImageView.bottomAnchor, constant: titleLabelTop),
            .centerX(centerXAnchor),
            .widthTo(widthAnchor, 0.8)
        )
        
        subtitleLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: titleLabelTop / 2),
            .centerX(centerXAnchor),
            .widthTo(widthAnchor, 0.8)
        )
        
        actionButton.anchor(
            .top(subtitleLabel.bottomAnchor, constant: actionButtonTop),
            .centerX(centerXAnchor)
        )
    }
}

private extension EmptyPlaceholderView {
    func makeEmptyBoxImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Typography.regular14.font
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }
    
    func makeSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Typography.regular12.font
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }
    
    func makeActionButton() -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.font = Typography.medium16.font
        button.contentHorizontalAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }
}

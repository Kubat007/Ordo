import UIKit

protocol ProductListTVCellDelegate: AnyObject {
    func deleteTapped(cell: ProductListTVCell)
}

final class ProductListTVCell: UITableViewCell {
    lazy var iconView = makeIconView()
    lazy var titleLabel = makeLabel(font: Typography.semibold16.font, color: .label)
    lazy var dateLabel = makeLabel(font: Typography.regular14.font, color: .secondaryLabel)
    lazy var deleteButton = makeDeleteButton()
    
    weak var delegate: ProductListTVCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: ListModel.Response.GetListResults?) {
        titleLabel.text = product?.name
        dateLabel.text = product?.created_at
    }
}

extension ProductListTVCell: BaseCV {
    public func setSubviews() {
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(deleteButton)
    }
}

// MARK: - UI Factory
private extension ProductListTVCell {
    func makeIconView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "doc.text.fill")
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.anchor(
            .centerX(view.centerXAnchor),
            .centerY(view.centerYAnchor),
            .width(28),
            .height(28)
        )
        return view
    }
    
    func makeLabel(font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 0
        return label
    }
    
    func makeDeleteButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .systemRed
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func deleteButtonTapped() {
        delegate?.deleteTapped(cell: self)
    }
}

extension ProductListTVCell {
    public func setConstraints() {
        iconView.anchor(
            .leading(contentView.leadingAnchor, constant: 16),
            .centerY(contentView.centerYAnchor),
            .width(50),
            .height(50)
        )
        
        titleLabel.anchor(
            .top(contentView.topAnchor, constant: 16),
            .leading(iconView.trailingAnchor, constant: 12),
            .trailing(deleteButton.leadingAnchor, constant: 12)
        )
        
        dateLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 4),
            .leading(titleLabel.leadingAnchor),
            .trailing(titleLabel.trailingAnchor)
        )
        
        deleteButton.anchor(
            .trailing(contentView.trailingAnchor, constant: 16),
            .centerY(contentView.centerYAnchor),
            .width(32),
            .height(32)
        )
    }
}

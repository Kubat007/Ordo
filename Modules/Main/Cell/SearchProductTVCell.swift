import UIKit

final class SearchProductCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemBlue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        contentView.addSubview(stack)
        stack.anchor(
            .top(contentView.topAnchor, constant: 12),
            .leading(contentView.leadingAnchor, constant: 16),
            .trailing(contentView.trailingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 12)
        )
    }
    
    func configure(with product: MainModels.Response.Banner) {
        nameLabel.text = product.title
        priceLabel.text = "\(Int(product.id)) KGS"
    }
}

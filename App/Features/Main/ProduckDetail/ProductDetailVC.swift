// ProductDetailVC.swift
import UIKit

final class ProductDetailVC: UIViewController {
    private let product: MainModels.Response.Banner
    
    init(product: MainModels.Response.Banner) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = product.title
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
        let nameLabel = UILabel()
        nameLabel.text = product.title
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        let priceLabel = UILabel()
        priceLabel.text = "\(Int(product.id)) KGS"
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        priceLabel.textColor = .systemBlue
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = product.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        view.addSubview(stackView)
        stackView.anchor(
            .centerX(view.centerXAnchor),
            .centerY(view.centerYAnchor),
            .leading(view.leadingAnchor, constant: 16),
            .trailing(view.trailingAnchor, constant: 16)
        )
    }
}

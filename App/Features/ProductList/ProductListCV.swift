import UIKit

public final class ProductListCV: UIView {
    private lazy var emtyImage = makeImageView()
    private lazy var emtylabel = makeLabel()
    
    lazy var tableView = makeTableView()
    lazy var addButton = makeAddButton()
    
    var onAddTapped: (() -> Void)?
    var onAddListTapped: (() -> Void)?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setEmptyState(isEmpty: Bool) {
        emtyImage.isHidden = !isEmpty
        emtylabel.isHidden = !isEmpty
        tableView.isHidden = isEmpty
        addButton.isHidden = isEmpty
    }
}

// MARK: - Setup UI
extension ProductListCV: BaseCV {
    public func setSubviews() {
        addSubview(emtyImage)
        addSubview(emtylabel)
        addSubview(tableView)
        addSubview(addButton)
    }
}

// MARK: - UI Factory
extension ProductListCV {
    private func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Images/emtyList")
        return image
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = Typography.bold14.font
        label.text = "🛒 Функция автоматического подбора товаров по списку.В нашем приложении доступна удобная функция, позволяющая быстро собрать нужные товары без долгого поиска. Введите список товаров вручную — напишите, что хотите купить (например: хлеб, масло, лук). Система автоматически подберёт товары из каталога, соответствующие вашему запросу."
        return label
    }
    
    func makeTableView() -> UITableView {
        let table = UITableView()
        table.register(ProductListTVCell.self, forCellReuseIdentifier: "ProductListTVCell")
        table.backgroundColor = .systemBackground
        table.separatorStyle = .singleLine
        table.rowHeight = 80
        table.showsVerticalScrollIndicator = false
        table.isHidden = true
        return table
    }
    
    func makeAddButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.10, green: 0.35, blue: 0.85, alpha: 1.00)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.isHidden = true // Скрыт по умолчанию
        return button
    }
    
    @objc private func addButtonTapped() {
        onAddTapped?()
    }
    
    @objc private func addListButtonTapped() {
        onAddListTapped?()
    }
}

// MARK: - Constraints
extension ProductListCV {
    public func setConstraints() {
        emtyImage.anchor(
            .top(safeAreaLayoutGuide.topAnchor, constant: 116),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .height(90),
            .width(60)
        )
        
        emtylabel.anchor(
            .top(emtyImage.bottomAnchor, constant: 16),
            .leading(leadingAnchor, constant: 32),
            .trailing(trailingAnchor, constant: 32)
        )
        
        tableView.anchor(
            .top(safeAreaLayoutGuide.topAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(safeAreaLayoutGuide.bottomAnchor)
        )
        
        addButton.anchor(
            .trailing(trailingAnchor, constant: 20),
            .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 20),
            .width(60),
            .height(60)
        )
    }
}

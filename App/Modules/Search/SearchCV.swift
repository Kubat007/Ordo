import UIKit

public final class SearchCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var searchBar = makeSearchBar()
    lazy var tableView = makeTableView()
    
    let viewsLeadingTrailing = 16
    let searchBarHeight = 66
    
    var onBackTapped: (() -> Void)?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup subviews and constraints
extension SearchCV {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    public func setConstraints() {
        navigationBar.anchor(
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .top(safeAreaLayoutGuide.topAnchor)
        )
        
        searchBar.anchor(
            .leading(leadingAnchor, constant: CGFloat(viewsLeadingTrailing / 2)),
            .trailing(trailingAnchor, constant: CGFloat(viewsLeadingTrailing / 2)),
            .height(CGFloat(searchBarHeight)),
            .top(navigationBar.bottomAnchor)
        )
        
        tableView.anchor(
            .top(searchBar.bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
    }
    
    public func setProperties() {
        backgroundColor = .systemBackground
    }
}

private extension SearchCV {
    func makeNavigationBar() -> UIView {
        let navbar = UIView()
        navbar.backgroundColor = .systemBackground
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Назад", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.text = "Поиск"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center
        
        navbar.addSubview(backButton)
        navbar.addSubview(titleLabel)
        
        backButton.anchor(
            .leading(navbar.leadingAnchor, constant: 16),
            .centerY(navbar.centerYAnchor)
        )
        
        titleLabel.anchor(
            .centerX(navbar.centerXAnchor),
            .centerY(navbar.centerYAnchor)
        )
        
        navbar.anchor(.height(44))
        
        return navbar
    }
    
    func makeSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск продуктов..."
        searchBar.backgroundImage = UIImage()
        searchBar.searchBarStyle = .minimal
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .systemGray6
            searchBar.searchTextField.layer.cornerRadius = 8
            searchBar.searchTextField.clipsToBounds = true
        }
        
        return searchBar
    }
    
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(SearchProductCell.self, forCellReuseIdentifier: "SearchProductCell")
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 80
        tableView.keyboardDismissMode = .interactive
        return tableView
    }
    
    @objc func backTapped() {
        onBackTapped?()
    }
}

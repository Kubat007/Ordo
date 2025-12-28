import UIKit

public final class MainCV: UIView {
    lazy var searchButton = makeSearchBar()
    lazy var mainCollection = makeCollectionView()
    lazy var filterButton = makeFilterButton()
    var onSearchTapped: (() -> Void)?
    
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
extension MainCV: BaseCV {
    public func setSubviews() {
        addSubview(searchButton)
        addSubview(mainCollection)
        addSubview(filterButton)
    }
    
    public func setConstraints() {
        searchButton.anchor(
            .top(safeAreaLayoutGuide.topAnchor, constant: 16),
            .leading(leadingAnchor, constant: 16),
            .trailing(trailingAnchor, constant: 16),
            .height(44)
        )
        
        mainCollection.anchor(
            .top(searchButton.bottomAnchor, constant: 16),
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor)
        )
        
        filterButton.anchor(
            .centerY(searchButton.centerYAnchor),
            .trailing(trailingAnchor, constant: 16),
            .width(30),
            .height(30)
        )
    }
}

// MARK: - UI Components Factory
private extension MainCV {
        func makeSearchBar() -> UISearchBar {
            let searchBar = UISearchBar()
            searchBar.backgroundImage = UIImage()
            searchBar.searchBarStyle = .minimal
            searchBar.isUserInteractionEnabled = true
            searchBar.delegate = self
            searchBar.borderWidth = 1
            searchBar.borderColor = Asset.Colors.b7B7B7.color
            searchBar.layer.cornerRadius = 10
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            toolbar.tintColor = .darkGray
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "Закрыть", style: .done, target: self, action: #selector(searchBarDoneButtonTapped))
            doneButton.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue, .font: UIFont.systemFont(ofSize: 17, weight: .medium)], for: .normal)
            toolbar.items = [flexibleSpace, doneButton]
            searchBar.searchTextField.backgroundColor = .clear
            searchBar.searchTextField.layer.cornerRadius = 10
            searchBar.searchTextField.clipsToBounds = true
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0),
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)]
            searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск...", attributes: placeholderAttributes)
            searchBar.searchTextField.leftView?.tintColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
            searchBar.searchTextField.textColor = .black
            searchBar.searchTextField.inputAccessoryView = toolbar
            UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .darkGray
            searchBar.removeBackgroundView()
            if let clearButton = searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
                let clearImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
                clearButton.setImage(clearImage, for: .normal)
                clearButton.tintColor = UIColor.red
            }
            return searchBar
        }

    @objc private func searchBarDoneButtonTapped() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func makeCollectionView() -> UICollectionView {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(BannersCell.self, forCellWithReuseIdentifier: "BannersCell")
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.registerHeaderView(CollectionHeaderView1.self)
        collectionView.backgroundColor = UIColor(white: 0.96, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }
    
    func makeFilterButton() -> UIButton {
            let button = UIButton()
            button.setImage(UIImage(systemName: "slider.horizontal.3")?.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tintColor = .black
            return button
        }
    
    @objc private func searchButtonTapped() {
        onSearchTapped?()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch sectionIndex {
            case 0:
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .absolute(120))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.interItemSpacing = .fixed(16)
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [header]
                section.interGroupSpacing = 16
                section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 24, trailing: 16)
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(150))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.interGroupSpacing = 16
                section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
                return section
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.interItemSpacing = .fixed(16)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 16
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
                return section
            default:
                fatalError("Unknown section")
            }
        }
    }
}

extension MainCV: UISearchBarDelegate {
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        toggleSearchBarCancelButtonVisibility(isVisible: false) // Скрываем кнопку Cancel
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        toggleSearchBarCancelButtonVisibility(isVisible: false)
        searchBar.text = ""
        searchChats(searchText: "")
        searchBar.resignFirstResponder()
    }
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        }
        return true
    }
    
    public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchChats(searchText: searchText)
        filterButton.isHidden = !searchText.isEmpty
    }
    
    private func toggleSearchBarCancelButtonVisibility(isVisible: Bool) {
        searchButton.setShowsCancelButton(isVisible, animated: true)
        searchButton.showsCancelButton = isVisible
    }
    
    func searchChats(searchText: String) {
        // Ваша логика поиска
    }
}

extension MainCV {
    private func setupFilterButtonObserver(for searchBar: UISearchBar) {
        if #available(iOS 13.0, *) {
            NotificationCenter.default.addObserver(
                forName: UITextField.textDidChangeNotification,
                object: searchBar.searchTextField,
                queue: .main
            ) { [weak self] notification in
                if let textField = notification.object as? UITextField {
                    self?.updateClearButtonVisibility(for: textField)
                }
            }
        }
    }
    
    private func updateClearButtonVisibility(for textField: UITextField) {
        if let container = textField.rightView as? UIView,
           let clearButton = container.subviews.last as? UIButton {
            clearButton.isHidden = textField.text?.isEmpty ?? true
        }
    }
}

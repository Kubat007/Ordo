import UIKit

final class SearchVC: UIViewController {
    private let viewModel: SearchVM
    private let searchView = SearchCV()
    
    init(viewModel: SearchVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        setupBindings()
        
        searchView.searchBar.becomeFirstResponder()
    }
    
    private func setupSearchBar() {
        searchView.searchBar.delegate = self
    }
    
    private func setupTableView() {
        searchView.tableView.dataSource = self
        searchView.tableView.delegate = self
    }
    
    private func setupBindings() {
        searchView.onBackTapped = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}

// MARK: - UISearchBarDelegate
extension SearchVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        viewModel.searchResults = []
        searchView.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 2 {
            viewModel.search(query: searchText)
            searchView.tableView.reloadData()
        } else {
            viewModel.searchResults = []
            searchView.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - UITableView
extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchProductCell", for: indexPath) as! SearchProductCell
        let product = viewModel.searchResults[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.searchResults[indexPath.row]
        viewModel.productSelected(product)
    }
}

final class SearchVM {
    var onBackAction: (() -> Void)?
    var onProductTapped: ((MainModels.Response.Banner) -> Void)?
    
    var searchResults: [MainModels.Response.Banner] = []
    
    func search(query: String) {
        // Фильтруем товары по запросу
//        searchResults = MainModels.Response.Products.filter { product in
//            product.name.lowercased().contains(query.lowercased()) ||
//            product.description.lowercased().contains(query.lowercased())
//        }
    }
    
    func backTapped() {
        onBackAction?()
    }
    
    func productSelected(_ product: MainModels.Response.Banner) {
        onProductTapped?(product)
    }
}

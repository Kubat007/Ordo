import Foundation

protocol ProductListVMDelegate: AnyObject {
    func didUpdateProducts()
    func didAddProduct(at index: Int)
    func didDeleteProduct(at index: Int)
    func navigateToMyList(listName: String)
    func failure(with error: String)
}

final class ProductListVM: BaseVM {
    var services: ApiServices!
    var products: [ProductListModels.Product] = []
    
    weak var delegate: ProductListVMDelegate?
    
    // MARK: - Load Products
    func loadProducts() {
        // Временные данные для демонстрации
        products = [
            ProductListModels.Product(id: 1, name: "Тоголок молдо 30", date: "20-11-2025"),
            ProductListModels.Product(id: 2, name: "Аламедин-1, 65", date: "05-11-2025"),
            ProductListModels.Product(id: 3, name: "Дядь Саша, Микраша", date: "17-10-2025"),
            ProductListModels.Product(id: 4, name: "Мирлан Байке", date: "02-10-2025"),
            ProductListModels.Product(id: 5, name: "Айнура эже", date: "15-09-2025")
        ]
        delegate?.didUpdateProducts()
    }
    
    // MARK: - Add Product
    func addNewProduct() {
        let newId = (products.map { $0.id }.max() ?? 0) + 1
        let newProduct = ProductListModels.Product(
            id: newId,
            name: "Новый продукт",
            date: getCurrentDate()
        )
        products.insert(newProduct, at: 0)
        delegate?.didAddProduct(at: 0)
    }
    
    // MARK: - Delete Product
    func deleteProduct(at index: Int) {
        guard index < products.count else { return }
        products.remove(at: index)
        delegate?.didDeleteProduct(at: index)
    }
    
    func createNewList(name: String) {
        let newId = (products.map { $0.id }.max() ?? 0) + 1
        let newProduct = ProductListModels.Product(
            id: newId,
            name: name,
            date: getCurrentDate()
        )
        products.insert(newProduct, at: 0)
        delegate?.didAddProduct(at: 0)
        
        // Переходим к экрану MyListVC
        delegate?.navigateToMyList(listName: name)
    }
    
    // MARK: - API Call Example (если нужно делать запросы на сервер)
    @MainActor
    func fetchProducts() {
        Task {
            do {
                // Пример запроса через API
                // let response = try await self.services?.repository.productList.getProducts()
                // self.products = response ?? []
                // delegate?.didUpdateProducts()
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func createProduct(name: String) {
        Task {
            do {
                // Пример создания продукта через API
                // let response = try await self.services?.repository.productList.createProduct(name: name)
                // delegate?.didAddProduct(at: 0)
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Helper
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: Date())
    }
}

// MARK: - Models
enum ProductListModels {
    struct Product {
        let id: Int
        let name: String
        let date: String
    }
}

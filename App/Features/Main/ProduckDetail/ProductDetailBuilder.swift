import UIKit

final class ProductDetailBuilder {
    static func build(product: MainModels.Response.Banner) -> UIViewController {
        return ProductDetailVC(product: product)
    }
}

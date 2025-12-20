import UIKit

struct TabBarBuilder {
    static func build(services: ApiServices) -> TabBarVC {
        return TabBarVC(services: services)
    }
}

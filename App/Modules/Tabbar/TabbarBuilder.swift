import UIKit

struct TabBarBuilder {
    static func build(services: Services) -> TabBarVC {
        return TabBarVC(services: services)
    }
}

import Foundation

enum PlistKey: String, CaseIterable {
    case ordoBaseUrlAPI = "umaiBaseUrlAPI"
    case dosBaseUrlAPI = "APP_DOS_API_BASE_URL"
    case playerStatsBaseUrl = "APP_PLAYER_STATS_BASE_API_URL"
    case appstoreLink = "APP_STORE_LINK"
    case sentryDSN = "APP_SENTRY_DSN"
    case helpUrl = "APP_HELP_URL"
}

enum Environment {
    enum EnvironmentType {
        case debug
        case release
    }
    
    static var current: EnvironmentType {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }
    
    private static var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }
    
    static func configuration(_ key: PlistKey) -> String {
        guard let configValue = infoDict[key.rawValue] as? String else {
            fatalError("Couldn't find such string for '\(key.rawValue)' key in plist configuration file")
        }
        return configValue
    }
}

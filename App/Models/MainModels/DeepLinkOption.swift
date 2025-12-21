//
//  DeepLinkOption.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

public enum DeepLinkURLConstants {
    static let Settings = "settings"
    static let Login = "login"
    static let SignUp = "signUp"
}

public enum DeepLinkOption {
    case settings
    case login
    case signUp
    
    public static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
           let url = userActivity.webpageURL,
           let components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            // TODO: extract string and match with DeepLinkURLConstants
            print("URL components: \(components)")
        }
        return nil
    }
    
    public static func build(with dict: [String: AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["launch_id"] as? String else { return nil }
        
        switch id {
        case DeepLinkURLConstants.Settings:
            return .settings
        case DeepLinkURLConstants.Login:
            return .login
        case DeepLinkURLConstants.SignUp:
            return .signUp
        default:
            return nil
        }
    }
    
    public static func build(with userInfo: [AnyHashable: Any]) -> DeepLinkOption? {
        //        guard let notification = NotificationModels.PushNotification.map(userInfo) else { return nil }
        //
        //        switch notification.type {
        //        case .settings:
        //            return .settings
        //        case .login:
        //            return .login
        //        }
        return nil
    }
}

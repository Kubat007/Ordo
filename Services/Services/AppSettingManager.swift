import Foundation

enum AppLanguage: String {
   case ru = "ru"
   case en = "en"
   case ky = "ky"
}

class AppSettingsManager {
    init() {
    }
    
    func applyLanguageSettings(newLanguage: AppLanguage) {
        UserDefaults.standard.set([newLanguage.rawValue], forKey: "AppleLanguages")
        UserDefaults.standard.set(newLanguage.rawValue, forKey: "AppleLanguage")
        UserDefaults.standard.synchronize()
        
//        Defaults[.appLanguage] = newLanguage
        
        Bundle.setLanguage(newLanguage.rawValue)
//        PasscodeLock.updateAppearance()
    }
}

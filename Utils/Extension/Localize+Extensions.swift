import Foundation

//MARK: Bundle extension to change locale within the app
var bundleKey: UInt8 = 0
class AnyLanguage: Bundle {
   override func localizedString(forKey key: String,
                                 value: String?,
                                 table tableName: String?) -> String {
      guard let path = objc_getAssociatedObject(self, &bundleKey) as? String,
         let bundle = Bundle(path: path) else {
            return super.localizedString(forKey: key, value: value, table: tableName)
      }
      return bundle.localizedString(forKey: key, value: value, table: tableName)
   }
}

extension Bundle {
   class func setLanguage(_ language: String) {
      defer {
         object_setClass(Bundle.main, AnyLanguage.self)
      }
      objc_setAssociatedObject(Bundle.main, &bundleKey,
                               Bundle.main.path(forResource: language, ofType: "lproj"),
                               .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
   }
}

//MARK: Localizable UI components
protocol Localizable {
   var localized: String { get }
}

extension String: Localizable {
   var localized: String {
      return NSLocalizedString(self, comment: self)
   }
}

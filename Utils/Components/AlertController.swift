import Foundation
import UIKit

extension UIAlertController {
    class func showError(_ message : String?, handler : ((UIAlertAction) -> ())? = nil) {
        guard message != nil else {
            return
        }
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: handler)
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showMessage(_ message : String, title : String, handler : ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showSelectionAlert(_ message : String, title : String, handler : ((UIAlertAction) -> Swift.Void)? = nil,
                                  cancelHandler : ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelHandler)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showSelectionDeleteAlert(_ message : String, title : String, handler : ((UIAlertAction) -> Swift.Void)? = nil,
                                        cancelHandler : ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Delete", style: .destructive, handler: handler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelHandler)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showAccessError(title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
            UIApplication.shared.open(URL(string : UIApplication.openSettingsURLString)!)
        }
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showActionSheet(presenter : UIViewController, title : String?, message : String?,
                               actionTitles : [String], handler : @escaping (UIAlertController, UIAlertAction?) -> Void) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for title in actionTitles {
            actionSheet.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
                handler(actionSheet, action)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            handler(actionSheet, nil)
        }))
        presenter.present(actionSheet, animated: true, completion: nil)
    }
    
}

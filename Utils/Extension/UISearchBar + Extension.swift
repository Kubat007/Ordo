// UISearchBar+Compatible.swift
import UIKit

extension UISearchBar {
    var compatibleSearchTextField: UITextField {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            if let textField = self.value(forKey: "searchField") as? UITextField {
                return textField
            } else {
                return UITextField()
            }
        }
    }
}

//
//  String+Extension.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import Foundation
import UIKit

public extension String {
    var isNumeric: Bool {
      return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
    }
    
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    
    var onlyLetters: String {
        return String(unicodeScalars.filter(CharacterSet.letters.contains))
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    var onlyNumeric: String {
        return self.filter("0123456789.".contains)
    }
    
    func capturedGroups(withRegex pattern: String) -> [String] {
       var results = [String]()
       
       var regex: NSRegularExpression
       do {
          regex = try NSRegularExpression(pattern: pattern, options: [])
       } catch {
          return results
       }
       
       let matches = regex.matches(in: self, options: [], range: NSRange(location:0, length: self.count))
       
       guard let match = matches.first else { return results }
       
       let lastRangeIndex = match.numberOfRanges - 1
       guard lastRangeIndex >= 1 else { return results }
       
       for i in 1...lastRangeIndex {
          let capturedGroupIndex = match.range(at: i)
          let matchedString = (self as NSString).substring(with: capturedGroupIndex)
          results.append(matchedString)
       }
       
       return results
    }
    
    func matchesPattern(_ pattern : String) -> Bool {
       var regex: NSRegularExpression
       do {
          regex = try NSRegularExpression(pattern: pattern, options: [])
       } catch {
          return false
       }
       return regex.matches(in: self, options: [], range: NSRange(location:0, length: self.count)).first != nil
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US")
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func formattedNumber() -> String {
        let cleanPhoneNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+XXX (XXX) XX-XX-XX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func htmlAttributedString() -> NSMutableAttributedString {
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            return NSMutableAttributedString()
        }
        guard let formattedString = try? NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) else {
            return NSMutableAttributedString()
        }
        return formattedString
    }
    
    func validPhoneNumber() -> String {
        var phoneNumber = self
        phoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
        phoneNumber = phoneNumber.replacingOccurrences(of: "(", with: "")
        phoneNumber = phoneNumber.replacingOccurrences(of: ")", with: "")
        phoneNumber = phoneNumber.replacingOccurrences(of: "-", with: "")
        return phoneNumber
    }
    
    func attributedStringWithStroke(foregroundColor: UIColor?, strokeColor: UIColor, strokeWidth: Float?) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: foregroundColor ?? Asset.Colors.white.color,
            NSAttributedString.Key.strokeColor: strokeColor,
            NSAttributedString.Key.strokeWidth: strokeWidth ?? -1.0
        ]
        let textWithStroke = NSAttributedString(
            string: self,
            attributes: attributes
        )
        return textWithStroke
    }
    
    func extractPhoneNumber() -> String? {
       var phone = self.replacingOccurrences( of:"[^0-9]", with: "", options: .regularExpression)
       guard phone.count > 5, (phone.hasPrefix("0") || phone.hasPrefix("996")) else {
          return nil
       }
       if phone.hasPrefix("0") {
          phone.remove(at: phone.startIndex)
       }
       if phone.hasPrefix("996") {
          let prefixIndex = phone.index(phone.startIndex, offsetBy: 3)
          phone = String(phone[prefixIndex...])
       }
       return phone
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

protocol StringType {
    var isEmpty: Bool { get }
}

extension String : StringType { }

extension Optional where Wrapped: StringType {
    var isNullOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

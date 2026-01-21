//
//  Date+Extension.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 19/1/26.
//

import Foundation

extension Date {
    func toStringDateCalendar() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    func toStringDateCalendar12() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm:ss a"
        return dateFormatter.string(from: self)
    }
}

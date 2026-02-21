//
//  HTTPClient+Extension.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 14/2/26.
//

import RealHTTP
import Foundation

extension HTTPClient {
    func parseErrorMessage(from data: Data) -> String {
        if let array = try? JSONDecoder().decode([String].self, from: data),
           let first = array.first {
            return first
        }
        if let object = try? JSONDecoder().decode([String: String].self, from: data),
           let detail = object["detail"] {
            return detail
        }
        if let string = String(data: data, encoding: .utf8) {
            return string
        }

        return "Произошла ошибка"
    }
}

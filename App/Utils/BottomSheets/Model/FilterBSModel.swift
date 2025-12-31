//
//  FilterBSModel.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/12/25.
//

enum DateSort {
    case asc
    case desc
}

enum PriceSort {
    case expensive
    case cheap
}

struct FilterState {
    var dateSort: DateSort?
    var priceSort: PriceSort?
    
    var isValid: Bool {
        dateSort != nil || priceSort != nil
    }
}

struct FilterBottomSheetModel {
    var category: String?
    var priceFrom: String?
    var priceTo: String?
    var currency: Currency = .kgs
    var sort: SortType?
}

enum SortType {
    case dateAsc
    case dateDesc
    case expensive
    case cheap
}

enum Currency: String, CaseIterable {
    case kgs = "KGS"
    case usd = "USD"
    case eur = "EUR"
}

struct BottomSheetFAQModel {
    let title: String
    let text: String
}


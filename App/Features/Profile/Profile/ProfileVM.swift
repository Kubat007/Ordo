//
//  ProfileVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

struct SettingsSectionCellData {
    var title: String
    var desc: String?
    var image: UIImage?
}

final class ProfileVM: BaseVM {
    var services: Services!
    var onAuthAction: (() -> Void)?
    var favoriteList: [MainModels.Response.Banner] = []
    var appearanceSectionCell = [SettingsSectionCellData]()
    var onNewsAction: (() -> Void)?
    var onFAQAction: (() -> Void)?
    var onHistoryAction: (() -> Void)?
    var onAboutAppAction: (() -> Void)?
    
    func setupAppearanceCell() {
        self.appearanceSectionCell = [
            SettingsSectionCellData(title: "Заказы".localized, desc: "Ближайшие: не ожидается", image: Asset.Images.Disclosure.disclosure_right.image),
            SettingsSectionCellData(title: "Покупки".localized, desc: "Здесь можно формить заказ заново", image: Asset.Images.Disclosure.disclosure_right.image),
            SettingsSectionCellData(title: "Способ оплаты".localized, desc: "Выберите удобный способ оплаты", image: Asset.Images.Disclosure.disclosure_right.image),
            SettingsSectionCellData(title: "Новости".localized, desc: "", image: Asset.Images.Disclosure.disclosure_right.image),
            SettingsSectionCellData(title: "FAQ".localized, desc: "", image: Asset.Images.Disclosure.disclosure_right.image),
            SettingsSectionCellData(title: "Приложение".localized, desc: "", image: Asset.Images.Disclosure.disclosure_right.image)
        ]
    }
}

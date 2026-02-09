//
//  SubCategoryVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 25/1/26.
//

final class SubCategoryVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    var model: [MainModels.Response.SubCategories] = []
    var onMainProductVC: ((_ id: Int) -> Void)?
}

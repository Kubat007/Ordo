//
//  YandexMapVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/3/26.
//

protocol YandexMapVMDelegate: AnyObject {

}

final class YandexMapVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    
    weak var delegate: YandexMapVMDelegate?
    var selectedAddress: String?
}

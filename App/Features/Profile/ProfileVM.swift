//
//  ProfileVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

final class ProfileVM: BaseVM {
    var services: Services!
    var onAuthAction: (() -> Void)?
    var favoriteList: [MainModels.Response.Banner] = []
    
}

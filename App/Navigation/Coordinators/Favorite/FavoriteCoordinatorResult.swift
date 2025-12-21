//
//  FavoriteCoordinatorResult.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol FavoriteCoordinatorResult: Coordinator {
    var finishFlow: (() -> Void)? { get set }
}

//
//  ProductListCoordinatorResult.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol ProductListCoordinatorResult: Coordinator {
    var finishFlow: (() -> Void)? { get set }
}

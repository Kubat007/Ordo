//
//  MainCoordinatorResult.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/11/25.
//
protocol MainCoordinatorResult: Coordinator {
    var finishFlow: (() -> Void)? { get set }
}

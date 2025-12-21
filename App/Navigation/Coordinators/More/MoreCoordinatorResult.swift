//
//  MoreCoordinatorResult.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol MoreCoordinatorResult: Coordinator {
    var finishFlow: (() -> Void)? { get set }
}

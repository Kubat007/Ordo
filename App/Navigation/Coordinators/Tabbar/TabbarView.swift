//
//  TabbarView.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol TabbarView: AnyObject {
    var onMainFlowSelect: ((BaseNC) -> Void)? { get set }
    var onFavoriteFlowSelect: ((BaseNC) -> Void)? { get set }
    var onProfileFlowSelect: ((BaseNC) -> Void)? { get set }
    var onMoreFlowSelect: ((BaseNC) -> Void)? { get set }
    var onProductListFlowSelect: ((BaseNC) -> Void)? { get set }
}

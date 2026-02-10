//
//  ListRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

protocol ListRepository {
    func getProductList() async throws -> ListModel.Response.GetList?
}

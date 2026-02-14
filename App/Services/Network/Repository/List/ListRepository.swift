//
//  ListRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

protocol ListRepository {
    func getProductList() async throws -> ListModel.Response.GetList?
    func addProductList(model: ListModel.Request.AddProductList) async throws -> ListModel.Response.GetAddProductList?
    func deleteProductList(id: Int) async throws -> EmptyResponse
    func getCollectProductList(model: ListModel.Request.SendCollectProductList) async throws -> ListModel.Response.GetCollectProductList?
    func changeProductList(model: ListModel.Request.SendChangeProductList, id: Int) async throws -> ListModel.Response.GetChangedProductList?
    func getDetailProductList(id: Int) async throws -> ListModel.Response.GetDetailProductListModel?
}

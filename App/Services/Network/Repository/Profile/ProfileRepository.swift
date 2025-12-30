//
//  ProfileRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

protocol ProfileRepository {
    func getNews() async throws -> BaseArrayModel<ProfileModel.Response.NewsModeL>
}

//
//  ProfileRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

protocol ProfileRepository {
    func getNews() async throws -> BaseArrayModel<ProfileModel.Response.NewsModeL>
    func getNewsDetail(newsId: Int) async throws -> ProfileModel.Response.NewsDetailModel
    func getFAQ() async throws -> BaseArrayModel<ProfileModel.Response.FAQModel>
    func getFAQDetail(faqId: Int) async throws -> ProfileModel.Response.FAQModel
}

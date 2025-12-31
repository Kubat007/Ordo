//
//  ProfileRemoteRepository.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

import Foundation
import RealHTTP

final class ProfileRemoteRepository: ProfileRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getNews() async throws -> BaseArrayModel<ProfileModel.Response.NewsModeL> {
        try await client.fetch(ProfileApi.GetNews())
    }
    
    func getNewsDetail(newsId: Int) async throws -> ProfileModel.Response.NewsDetailModel {
        try await client.fetch(ProfileApi.GetNewsDetail(newsId: newsId))
    }
    
    func getFAQ() async throws -> BaseArrayModel<ProfileModel.Response.FAQModel> {
        try await client.fetch(ProfileApi.GetFAQ())
    }
    
    func getFAQDetail(faqId: Int) async throws -> ProfileModel.Response.FAQModel {
        try await client.fetch(ProfileApi.GetFAQDetail(faqId: faqId))
    }
}

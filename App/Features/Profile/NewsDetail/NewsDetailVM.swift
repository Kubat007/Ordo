//
//  NewsDetailVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

protocol NewsDetailVMDelegate: AnyObject {
    func successDetail(model: ProfileModel.Response.NewsDetailModel)
    func failure(with error: String)
}

final class NewsDetailVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    weak var delegate: NewsDetailVMDelegate?
    var newsId: Int?
    
    @MainActor
    func getNews() {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.profile.getNewsDetail(newsId: newsId ?? 0)
                self.loadingIndicatorState = .loaded
                self.delegate?.successDetail(model: initialize)
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

//
//  NewsVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

protocol NewsVMDelegate: AnyObject {
    func successNews()
    func failure(with error: String)
}

final class NewsVM: BaseVM {
    var services: Services!
    var onAuthAction: (() -> Void)?
    var onBackAction: DefaultNavigationCallback?
    weak var delegate: NewsVMDelegate?
    var newsModel: [ProfileModel.Response.NewsModeL] = []
    
    
    @MainActor
    func getNews() {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.profile.getNews()
                self.loadingIndicatorState = .loaded
                self.newsModel = initialize.results ?? []
                self.delegate?.successNews()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

//
//  FAQVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

protocol FAQVMDelegate: AnyObject {
    func successFAQ()
    func successFAQDetail(model: ProfileModel.Response.FAQModel)
    func failure(with error: String)
}

final class FAQVM: BaseVM {
    var services: Services!
    weak var delegate: FAQVMDelegate?

    var onBackAction: (() -> Void)?
    var onFAQSelect: ((Int) -> Void)?
    var faqModel: [ProfileModel.Response.FAQModel] = []

    @MainActor
    func getFAQ() {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.profile.getFAQ()
                self.loadingIndicatorState = .loaded
                self.faqModel = initialize.results ?? []
                self.delegate?.successFAQ()
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func getFAQDetail(faqId: Int) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services.repository.profile.getFAQDetail(faqId: faqId)
                self.loadingIndicatorState = .loaded
                self.delegate?.successFAQDetail(model: initialize)
            } catch {
                self.loadingIndicatorState = .loaded
                self.delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}

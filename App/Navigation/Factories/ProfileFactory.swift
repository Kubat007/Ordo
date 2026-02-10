//
//  ProfileFactory.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol ProfileFactory {
    func makeProfileVC() -> ProfileVC
    func makeAuthVC() -> AuthVC
    func makeVerifyVC() -> VerifyVC
    func makeNewsVC() -> NewsVC
    func makeNewsDetailVC() -> NewsDetailVC
    func makeFAQVC() -> FAQVC
    func makeHistoryVC() -> HistoryVC
    func makeHistoryDetailVC() -> HistoryDetailVC
    func makeAboutAppVC() -> AboutAppVC
}

final class ProfileFactoryImpl: ProfileFactory {
    var services: Services
    
    func makeProfileVC() -> ProfileVC {
        return ProfileBuilder(services: services).build()
    }
    
    func makeAuthVC() -> AuthVC {
        return AuthBuilder(services: services).build()
    }
    
    func makeVerifyVC() -> VerifyVC {
        return VerifyBuilder(services: services).build()
    }
    
    func makeNewsVC() -> NewsVC {
        return NewsBuilder(services: services).build()
    }
    
    func makeNewsDetailVC() -> NewsDetailVC {
        return NewsDetailBuilder(services: services).build()
    }
    
    func makeFAQVC() -> FAQVC {
        return FAQBuilder(services: services).build()
    }
    
    func makeHistoryVC() -> HistoryVC {
        return HistoryBuilder(services: services).build()
    }
    
    func makeHistoryDetailVC() -> HistoryDetailVC {
        return HistoryDetailBuilder(services: services).build()
    }
    
    func makeAboutAppVC() -> AboutAppVC {
        return AboutAppBuilder(services: services).build()
    }
    
    init(services: Services) {
        self.services = services
    }
}

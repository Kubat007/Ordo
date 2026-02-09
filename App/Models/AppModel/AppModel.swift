import Foundation

//enum AppModels {
//    enum Response {
//        struct Initialize: Codable {
//            let configs: Dictionary<String,Int>
//            let faqList: [Faq]
//            let pageList: [Page]
//            
//            init() {
//                configs = [:]
//                faqList = []
//                pageList = []
//            }
//            
//            struct Faq: Codable {
//                let question: String
//                let answer: String
//                let isOpen: Bool
//            }
//            
//            struct Page: Codable {
//                let pageId: Int
//                let locale: String
//                let content: String
//                let pageName: PageName
//                let pagePath: String
//                let metaTitle: String
//                let metaDescription: String
//            }
//            
//            enum PageName: String, Codable {
//                case homepageHome = "homepage-home"
//                case homepageAbout = "homepage-about"
//                case terms
//                case privacy
//                case faq
//            }
//            
//            func getPageWith(pageName: PageName) -> Page? {
//                return pageList.first(where: { $0.pageName == pageName })
//            }
//        }
//        
//        struct Localize: Codable {
//            private var ru: String?
//            private var ky: String?
//            private var en: String?
//            
//            func getText() -> String? {
//                switch UserDefaults.standard.string(forKey: "AppleLanguages") {
//                case "ru": return ru
//                case "en": return en
//                case "ky": return ky
//                case .none:  return ""
//                case .some(_): return ""
//                }
//            }
//        }
//        
//        struct FirebaseRegister: Codable {
//            var data: String?
//            var msg: String?
//            var status: Int
//        }
//    }
//    
//    enum Request {
//        
//    }
//}

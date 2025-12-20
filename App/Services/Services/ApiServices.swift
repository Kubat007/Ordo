import RealHTTP

protocol ApiServices {
    typealias Repos = (
                       auth: AuthRepository,
                       main: MainRepository
//                       profile: ProfileRepository,
//                       campaign: CampaignRepository,
//                       payment: PaymentRepository,
//                       gov: GovRemoteRepository,
//                       usefull: UsefullRepository
    )
    
//    var instructor: Instructor { get set }
//    var session: Session { get set }
    var appSettingsManager: AppSettingsManager { get set }
    var repository: Repos { get set }
//    var contactsManager: ContactsManager { get set }
    var client: HTTPClient { get set }
//    var elcardManager: ElcardManager { get set }
//    var initializeManager: Initializable { get set }
//    var analyticsManager: AnalyticsManager { get set }
}

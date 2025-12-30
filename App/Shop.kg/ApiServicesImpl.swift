import RealHTTP

final class ApiServicesImpl: Services {
    var appSettingsManager: AppSettingsManager
    var client: HTTPClient
    var repository: Services.Repos
    
    init(
        repository: Services.Repos,
        client: HTTPClient,
        appSettingsManager: AppSettingsManager
    ) {
        self.repository = repository
        self.client = client
        self.appSettingsManager = appSettingsManager
    }
}

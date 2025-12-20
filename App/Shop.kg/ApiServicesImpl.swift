import RealHTTP

import RealHTTP

final class ApiServicesImpl: ApiServices {
    var appSettingsManager: AppSettingsManager
    var client: HTTPClient
    var repository: ApiServices.Repos
    
    init(
        repository: ApiServices.Repos,
        client: HTTPClient,
        appSettingsManager: AppSettingsManager
    ) {
        self.repository = repository
        self.client = client
        self.appSettingsManager = appSettingsManager
    }
}

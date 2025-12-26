import Foundation
import RealHTTP

final class AuthRemoteRepository: AuthRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func sendPhoneNumber(with phone: String) async throws -> AuthModel.Response.PhoneNumberModel {
        try await client.fetch(AuthApi.SendPhoneNumber(phone: phone))
    }
    
    func verifyPhoneNumber(with phone: String, code: String) async throws -> AuthModel.Response.PhoneNumberModel {
        try await client.fetch(AuthApi.Login(phone: phone, code: code))
    }
    
//    func refreshToken(token: String) async throws -> BaseModel<AuthModels.Response.AccessToken> {
//        try await client.fetch(AuthAPI.RefreshIdToken(refreshToken: token))
//    }
}

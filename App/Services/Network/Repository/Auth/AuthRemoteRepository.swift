import Foundation
import RealHTTP

final class AuthRemoteRepository: AuthRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
//    func login(with phone: String) async throws -> BaseModel<AuthModels.Response.Login> {
//        try await client.fetch(AuthAPI.Login(phone: phone))
//    }
//    
//    func verifyPhoneNumber(with phone: String, code: String) async throws -> BaseModel<AuthModels.Response.AccessToken> {
//        try await client.fetch(AuthAPI.VerifyPhoneNumber(msisdn: phone, otp: code, source: "mobile"))
//    }
//    
//    func refreshToken(token: String) async throws -> BaseModel<AuthModels.Response.AccessToken> {
//        try await client.fetch(AuthAPI.RefreshIdToken(refreshToken: token))
//    }
}

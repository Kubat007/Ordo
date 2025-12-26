protocol AuthRepository {
    func sendPhoneNumber(with phone: String) async throws -> AuthModel.Response.PhoneNumberModel
    func verifyPhoneNumber(with phone: String, code: String) async throws -> AuthModel.Response.PhoneNumberModel
//    func refreshToken(token: String) async throws -> BaseModel<AuthModels.Response.AccessToken>
}

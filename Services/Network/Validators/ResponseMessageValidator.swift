import RealHTTP
import Foundation

final class ResponseMessageValidator: HTTPValidator {
    func validate(response: HTTPResponse, forRequest request: HTTPRequest) -> HTTPResponseValidatorResult {
        let data = response.data ?? Data()
        if response.statusCode.responseType == .success && ResponseMessage(jsonData: data)?.status == 1000 {
            return .nextValidator
        } else {
            guard let data = response.data, let message = ResponseMessage(jsonData: data) else {
                return .nextValidator
            }
            guard response.statusCode != .locked else {
                return .failChain(HTTPError(.other, code: response.statusCode, error: message))
            }
            return .failChain(HTTPError(.other, code: response.statusCode, error: message))
        }
    }
}


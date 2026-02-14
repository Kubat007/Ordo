import Foundation
import RealHTTP

final class ResponseLogValidator: HTTPValidator {
    func validate(response: HTTPResponse, forRequest request: HTTPRequest) -> HTTPResponseValidatorResult {
        guard let dataRequest = response.urlRequests.current else {
            return .nextValidator
        }
        log("\n------------------------------")
        log("STATUSCODE: \(response.statusCode.rawValue)")
        log("HTTP METHOD: .\(dataRequest.method?.rawValue ?? "")")
        log("URL: \(dataRequest.url ?? "")")

        logHeaders(headers: dataRequest.allHTTPHeaderFields)

        if let body = dataRequest.body {
            log("REQUEST BODY:")
            logBody(data: body)
        }
        if let data = response.data {
            log("RESPONSE BODY:")
            logBody(data: data)
        }

        guard response.statusCode.responseType == .success else {
            logError(response: response)
            return .nextValidator
        }

        return .nextValidator
    }
}


// MARK: LOG METHODS
extension ResponseLogValidator {
    func log(_ text: String) {
        print(text)
    }
    
    func logBody(data: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            if let prettyString = String(data: prettyData, encoding: .utf8) {
                log(prettyString)
            }
        } catch {
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                print(string)
            }
        }
    }
    
    func logHeaders(headers: [AnyHashable: Any]?) {
        guard let headers = headers else {
            return
        }
        log("HEADERS: [")
        for (key, value) in headers {
            log("  \(key): \(value)")
        }
        log("]")
    }
    
    func logError(response: HTTPResponse) {
        guard let error = response.error else { return }
        log("❌")
        log("❗️ StatusCodeError: \(error.statusCode)")
        log("❗️ Category: \(error.category)")
        log("❗️ Description: \(error.localizedDescription)")

        if let message = error.message {
            log("❗️ ErrorMessage: \(message)")
        }
        log("❌")
    }
}

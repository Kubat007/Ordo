import RealHTTP
import Foundation

public protocol APIResourceConvertible {
    associatedtype Result: Decodable // the output object of the service
    func request() -> HTTPRequest // function which generate a request
}

public extension HTTPClient {
    func fetch<T: APIResourceConvertible>(_ convertible: T) async throws -> T.Result {
        let result = try await convertible.request().fetch(self)

        guard result.statusCode.responseType == .success else {
            if let data = result.data {
                let message = parseErrorMessage(from: data)
                throw APIError(
                    message: message,
                    statusCode: result.statusCode.rawValue
                )
            }
            throw APIError(
                message: "Ошибка сервера",
                statusCode: result.statusCode.rawValue
            )
        }

        if result.statusCode.rawValue == 204,
           T.Result.self == EmptyResponse.self {
            return EmptyResponse() as! T.Result
        }
        return try result.decode(T.Result.self)
    }
}

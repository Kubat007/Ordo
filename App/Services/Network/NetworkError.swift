import Foundation

struct NetworkError: Error {
    
    var statusCode: Int = -1
    var title: String = "Error"
    var message: String = "An unknown error has occurred"
 
    static var undefined = NetworkError(title: "Error", message: "An unknown error has occurred", code: -1)
    
    init(title: String? = "Error", message: String?, code: Int?) {
        self.title = title ?? "Error"
        self.message = message ?? "An unknown error has occurred"
        self.statusCode = code ?? -1
    }
    
    init(_ error: Error? = nil) {
        guard let networkError = error as? NetworkError else {
            title = "Error"
            message = error?.localizedDescription ?? ""
            statusCode = -1
            return
        }
        title = networkError.title
        message = networkError.message
        statusCode = networkError.statusCode
    }
}

enum ErrorModels {
    struct Message: Decodable {
        var success: Bool?
        var error: Error?
    }
    
    struct Error: Decodable {
        var message: String
        var code: Int?
    }
}

import Foundation

public enum APIError: Error {
    case invalidRequest
    case statusCode(Int)
    case noData
}

extension APIError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "The request was invalid. Please check the parameters and try again."
        case .statusCode(let code):
            return "Request failed with status code: \(code)."
        case .noData:
            return "No data returned by the server."
        }
    }
}

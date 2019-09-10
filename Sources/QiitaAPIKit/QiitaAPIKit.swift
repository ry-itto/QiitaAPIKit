import Foundation

public struct QiitaAPIKit {
    let urlSession: URLSessionProtocol
    
    init(_ urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
}

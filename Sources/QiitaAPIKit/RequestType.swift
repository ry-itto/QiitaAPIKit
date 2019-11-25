//
//  RequestType.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/29.
//

import Foundation

/// The protocol for requesting API request
public protocol RequestQueryItem {
    /// validate parameters
    func isValidParameters() -> Bool

    /// get query parameters
    func queryItems() -> [URLQueryItem]
}

/// Type of API Request
public protocol RequestType {
    associatedtype Request: RequestQueryItem
    associatedtype Response: Decodable

    /// String value of URL. e.g. http://example.com
    var requestURLString: String { get }

    /// type of Request's instance.
    var requestQueryItem: Request { get }

    /// Request Http Method.
    var httpMethod: HttpMethod { get }

    /// Qiita access token.
    var accessToken: String? { get }

    /// function of request
    /// - Parameter completion: execute this function when network connection completed.
    func request(completion: @escaping (Result<Response, Error>) -> Void)
}

public extension RequestType {
    func request(completion: @escaping (Result<Response, Error>) -> Void) {
        guard requestQueryItem.isValidParameters() else {
            completion(.failure(APIError.InvalidRequestParameter))
            return
        }

        var components = URLComponents(string: requestURLString)!
        components.queryItems = requestQueryItem.queryItems()

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        if let accessToken = accessToken {
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(APIError.DataIsNotFetched))
                return
            }
            do {
                let response = try decoder.decode(Response.self, from: data)
                completion(.success(response))
            } catch let e {
                completion(.failure(e))
            }
        }
        task.resume()
    }
}

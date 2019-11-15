//
//  RequestType.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/29.
//

import Foundation

public protocol RequestQueryItem {
    func isValidParameters() -> Bool
    func queryItems() -> [URLQueryItem]
}

public protocol RequestType {
    associatedtype Request: RequestQueryItem
    associatedtype Response: Decodable

    var requestURLString: String { get }
    var requestQueryItem: Request { get }
    var httpMethod: HttpMethod { get }

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

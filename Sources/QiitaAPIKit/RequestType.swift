//
//  RequestType.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/29.
//

import Foundation

protocol RequestQueryItem {
    func queryItems() -> [URLQueryItem]
}

protocol RequestType {
    associatedtype Request: RequestQueryItem
    associatedtype Response: Decodable

    var requestURLString: String { get }
    var requestQueryItem: Request { get }

    func request(completion: @escaping (Result<Response, Error>) -> Void)
}

extension RequestType {
    func request(completion: @escaping (Result<Response, Error>) -> Void) {
        var components = URLComponents(string: requestURLString)!
        components.queryItems = requestQueryItem.queryItems()

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        var request = URLRequest(url: components.url!)
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

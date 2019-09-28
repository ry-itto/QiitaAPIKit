//
//  ArticleRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/09/09.
//

import Foundation

public extension QiitaAPIKit {
    
    /// QiitaAPI v2 items API
    /// https://qiita.com/api/v2/docs#get-apiv2items
    ///
    /// - Parameters:
    ///     - page: page number default=1
    ///     - perPage: number of articles per page. default=20
    ///     - query: Search Query (Required)
    /// - Returns:
    ///     search result
    func fetchArticles(page: Int = 1, perPage: Int = 20, query: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        var components = URLComponents(string: "https://qiita.com/api/v2/items")!
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "perPage", value: "\(perPage)"),
            URLQueryItem(name: "query", value: query)
        ]
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        var request = URLRequest(url: components.url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(APIError.DataIsNotFetched))
                return
            }
            do {
                let articles = try decoder.decode([Article].self, from: data)
                completion(.success(articles))
            } catch let e {
                completion(.failure(e))
            }
        }
        
        task.resume()
    }
}

//
//  ArticleStockersRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/13.
//

import Foundation

public extension QiitaAPIKit {

    /// QiitaAPI v2 stockers API
    /// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idstockers
    ///
    /// - Parameter id: Article ID
    /// - Parameter page: page number
    /// - Parameter perPage: number of users per page
    /// - Parameter completion: Execute when this function completed
    func fetchArticleStockers(id: String, page: Int = 1, perPage: Int = 20, completion: @escaping (Result<[User], Error>) ->Void) {
        guard (1...100).contains(page), (1...100).contains(perPage) else {
            completion(.failure(APIError.OutOfRange))
            return
        }
        guard let components = URLComponents(string: "https://qiita.com/api/v2/items/\(id)/stockers") else {
            completion(.failure(APIError.ArticleIDIsNotValid))
            return
        }

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
                let stockers = try decoder.decode([User].self, from: data)
                completion(.success(stockers))
            } catch let e {
                completion(.failure(e))
            }
        }

        task.resume()
    }
}

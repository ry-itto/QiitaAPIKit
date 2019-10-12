//
//  ArticleLikesRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/12.
//

import Foundation

public extension QiitaAPIKit {

    /// QiitaAPI v2 likes API
    /// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idlikes
    ///
    /// - Parameter id: Article ID
    /// - Parameter completion: Execute when this function completed
    func fetchArticleLikes(id: String, completion: @escaping (Result<[ArticleLike], Error>) -> Void) {
        guard let components = URLComponents(string: "https://qiita.com/api/v2/items/\(id)/likes") else {
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
                let likes = try decoder.decode([ArticleLike].self, from: data)
                completion(.success(likes))
            } catch let e {
                completion(.failure(e))
            }
        }

        task.resume()
    }
}

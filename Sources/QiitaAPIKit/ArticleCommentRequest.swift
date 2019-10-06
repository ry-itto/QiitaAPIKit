//
//  ArticleCommentRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/03.
//

import Foundation

public extension QiitaAPIKit {
    
    /// QiitaAPI v2 comments API
    /// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idcomments
    ///
    /// - Parameter id: Article ID
    /// - Parameter completion: Execute when this function completed
    func fetchArticleComments(id: String, completion: @escaping (Result<[ArticleComment], Error>) ->Void) {
        guard let components = URLComponents(string: "https://qiita.com/api/v2/items/\(id)/comments") else {
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
                let comments = try decoder.decode([ArticleComment].self, from: data)
                completion(.success(comments))
            } catch let e {
                completion(.failure(e))
            }
        }

        task.resume()
    }
}

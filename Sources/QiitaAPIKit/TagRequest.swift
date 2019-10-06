//
//  TagRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/06.
//

import Foundation

public extension QiitaAPIKit {
    enum SortType: String {
        case count
        case name
    }

    /// Qiita API v2 tags API
    /// document: https://qiita.com/api/v2/docs#get-apiv2tags
    /// 
    /// - Parameter page: page
    /// - Parameter perPage: number of tags per page
    /// - Parameter sort: sort order
    /// - Parameter completion: completion
    func fetchTags(page: Int = 1, perPage: Int = 20, sort: SortType = .name, completion: @escaping (Result<[Tag], Error>) -> Void) {
        let components = URLComponents(string: "https://qiita.com/api/v2/tags")!

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
                let tags = try decoder.decode([Tag].self, from: data)
                completion(.success(tags))
            } catch let e {
                completion(.failure(e))
            }
        }

        task.resume()
    }
}

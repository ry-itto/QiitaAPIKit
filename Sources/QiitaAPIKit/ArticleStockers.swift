//
//  ArticleStockers.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/29.
//

import Foundation

public enum ArticleStockers {
    public struct Request: RequestQueryItem {
        public let page: Int
        public let perPage: Int

        public init(page: Int = 1, perPage: Int = 20) {
            self.page = page
            self.perPage = perPage
        }
        
        public func isValidParameters() -> Bool {
            return (1...100).contains(page)
                && (1...100).contains(perPage)
        }
        public func queryItems() -> [URLQueryItem] {
            return []
        }
    }

    public typealias Response = User
}

extension ArticleStockers.Response: Identifiable {}

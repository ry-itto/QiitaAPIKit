//
//  ArticleComment.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/03.
//

import Foundation

public enum ArticleComment {
    public struct Request: RequestQueryItem {
        public func isValidParameters() -> Bool {
            return true
        }

        public func queryItems() -> [URLQueryItem] {
            return []
        }
    }

    public struct Response: Decodable {
        public let body: String
        public let createdAt: Date
        public let id: String
        public let renderedBody: String
        public let updatedAt: Date
        public let user: User
    }
}

@available(iOS 13.0, *)
extension ArticleComment.Response: Identifiable {}

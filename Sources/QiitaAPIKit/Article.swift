//
//  Article.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/09/09.
//

import Foundation

/// Qiita記事モデル
public enum Article {
    public struct Request: RequestQueryItem {
        public let page: Int
        public let perPage: Int
        public let query: String

        public init(page: Int = 1, perPage: Int = 20, query: String) {
            self.page = page
            self.perPage = perPage
            self.query = query
        }

        public func isValidParameters() -> Bool {
            return (1...100).contains(page)
                && (1...100).contains(perPage)
        }

        public func queryItems() -> [URLQueryItem] {
            return [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "perPage", value: "\(perPage)"),
                URLQueryItem(name: "query", value: query)
            ]
        }
    }

    public struct Response: Decodable {
        public let renderedBody: String
        public let body: String
        public let coediting: Bool
        public let createdAt: Date
        public let group: Group?
        public let id: String
        public let likesCount: Int
        public let isPrivate: Bool
        public let reactionsCount: Int
        public let tags: [Tag]
        public let title: String
        public let updatedAt: Date
        public let url: URL
        public let user: User
        public let pageViewsCount: Int?

        enum CodingKeys: String, CodingKey {
            case renderedBody
            case body
            case coediting
            case createdAt
            case group
            case id
            case likesCount
            case isPrivate = "private"
            case reactionsCount
            case tags
            case title
            case updatedAt
            case url
            case user
            case pageViewsCount
        }

        public struct Tag: Decodable {
            public let name: String
            public let versions: [String]
        }
    }
}

public struct Group: Decodable {
    public let createdAt: Date
    public let id: Int
    public let name: String
    public let isPrivate: Bool
    public let updatedAt: Date
    public let urlName: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case id
        case name
        case isPrivate = "private"
        case updatedAt
        case urlName
    }
}

@available(iOS 13.0, *)
extension Article.Response: Identifiable {}

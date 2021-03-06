//
//  ArticleLike.swift
//  
//
//  Created by 伊藤凌也 on 2019/10/12.
//

import Foundation

public enum ArticleLike {
    public struct Request: RequestQueryItem {
        public func isValidParameters() -> Bool {
            return true
        }

        public func queryItems() -> [URLQueryItem] {
            return []
        }
    }

    public struct Response: Decodable {
        public let createdAt: Date
        public let user: User
    }
}

extension ArticleLike.Response: Identifiable {
    public var id: String {
        user.id
    }
}

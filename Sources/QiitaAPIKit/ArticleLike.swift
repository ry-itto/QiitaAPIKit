//
//  ArticleLike.swift
//  
//
//  Created by 伊藤凌也 on 2019/10/12.
//

import Foundation

public enum ArticleLike {
    public struct Request: RequestQueryItem {
        public func queryItems() -> [URLQueryItem] {
            return []
        }
    }

    public struct Response: Decodable {
        public let createdAt: Date
        public let user: User
    }
}

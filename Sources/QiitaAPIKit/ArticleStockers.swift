//
//  ArticleStockers.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/29.
//

import Foundation

public enum ArticleStockers {
    public struct Request: RequestQueryItem {
        public func queryItems() -> [URLQueryItem] {
            return []
        }
    }

    public typealias Response = User
}

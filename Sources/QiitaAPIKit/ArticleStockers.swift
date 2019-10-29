//
//  ArticleStockers.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/29.
//

import Foundation

public enum ArticleStockers {
    struct Request: RequestQueryItem {
        func queryItems() -> [URLQueryItem] {
            return []
        }
    }

    typealias Response = User
}

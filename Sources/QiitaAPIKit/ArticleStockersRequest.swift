//
//  ArticleStockersRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/13.
//

import Foundation

public extension QiitaAPIKit {

    struct ArticleStockersRequest: RequestType {
        typealias Response = [User]

        let id: String

        var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/stockers"
        }
        var queryItems: [URLQueryItem]? = []
    }
}

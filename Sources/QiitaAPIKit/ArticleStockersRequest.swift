//
//  ArticleStockersRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/13.
//

import Foundation

public extension QiitaAPIKit {

    /// QiitaAPI v2 stockers API
    /// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idstockers
    struct ArticleStockersRequest: RequestType {
        public typealias Request = ArticleStockers.Request
        public typealias Response = [ArticleStockers.Response]

        let id: String

        public var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/stockers"
        }
        public var requestQueryItem: ArticleStockers.Request {
            return ArticleStockers.Request()
        }

        public init(id: String) {
            self.id = id
        }
    }
}

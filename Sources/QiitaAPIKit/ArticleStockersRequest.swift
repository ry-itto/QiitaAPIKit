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
        typealias Request = ArticleStockers.Request
        typealias Response = [ArticleStockers.Response]

        let id: String

        var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/stockers"
        }
        var requestQueryItem: ArticleStockers.Request = ArticleStockers.Request()
    }
}

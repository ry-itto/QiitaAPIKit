//
//  ArticleRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/09/09.
//

import Foundation

public extension QiitaAPIKit {
    /// QiitaAPI v2 items API
    /// https://qiita.com/api/v2/docs#get-apiv2items
    struct ArticleRequest: RequestType {
        typealias Request = Article.Request
        typealias Response = [Article.Response]

        var requestURLString: String {
            return "https://qiita.com/api/v2/items"
        }
        var requestQueryItem: Article.Request
    }
}

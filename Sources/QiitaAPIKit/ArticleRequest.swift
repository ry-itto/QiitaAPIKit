//
//  ArticleRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/09/09.
//

import Foundation

/// QiitaAPI v2 items API
/// https://qiita.com/api/v2/docs#get-apiv2items
public struct ArticleRequest: RequestType {
    public typealias Request = Article.Request
    public typealias Response = [Article.Response]

    public var requestURLString: String {
        return "https://qiita.com/api/v2/items"
    }
    public var requestQueryItem: Article.Request

    public var httpMethod: HttpMethod = .GET

    public var accessToken: String?

    public init(accessToken: String? = nil, requestQueryItem: Request) {
        self.accessToken = accessToken
        self.requestQueryItem = requestQueryItem
    }
}

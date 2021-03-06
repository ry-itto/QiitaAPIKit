//
//  ArticleStockersRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/13.
//

import Foundation

/// QiitaAPI v2 stockers API
/// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idstockers
struct ArticleStockersRequest: RequestType {
    public typealias Request = ArticleStockers.Request
    public typealias Response = [ArticleStockers.Response]

    /// Article ID
    let id: String

    public var requestURLString: String {
        return "https://qiita.com/api/v2/items/\(id)/stockers"
    }
    public var requestQueryItem: ArticleStockers.Request

    public var httpMethod: HttpMethod = .GET

    public var accessToken: String?

    /// initializer
    /// - Parameter accessToken: Qiita access token
    /// - Parameter id: Article ID
    /// - Parameter requestQueryItems: Request item
    public init(accessToken: String? = nil, id: String, requestQueryItems: Request = Request()) {
        self.accessToken = accessToken
        self.id = id
        self.requestQueryItem = requestQueryItems
    }
}

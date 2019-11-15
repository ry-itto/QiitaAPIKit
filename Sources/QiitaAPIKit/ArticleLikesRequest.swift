//
//  ArticleLikesRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/12.
//

import Foundation

public extension QiitaAPIKit {

    /// QiitaAPI v2 likes API
    /// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idlikess
    struct ArticleLikesRequest: RequestType {
        public typealias Request = ArticleLike.Request
        public typealias Response = [ArticleLike.Response]

        let id: String

        public var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/likes"
        }
        public var requestQueryItem: ArticleLike.Request {
            return ArticleLike.Request()
        }

        public var httpMethod: HttpMethod = .GET

        public var accessToken: String?

        public init(accessToken: String?, id: String) {
            self.accessToken = accessToken
            self.id = id
        }
    }
}

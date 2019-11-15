//
//  ArticleCommentRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/03.
//

import Foundation

public extension QiitaAPIKit {

    /// QiitaAPI v2 comments API
    /// https://qiita.com/api/v2/docs#get-apiv2itemsitem_idcomments
    struct ArticleCommentRequest: RequestType {
        public typealias Request = ArticleComment.Request
        public typealias Response = [ArticleComment.Response]

        let id: String

        public var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/comments"
        }
        public var requestQueryItem: ArticleComment.Request {
            return ArticleComment.Request()
        }

        public var httpMethod: HttpMethod = .GET

        public var accessToken: String?

        public init(accessToken: String?, id: String) {
            self.accessToken = accessToken
            self.id = id
        }
    }
}

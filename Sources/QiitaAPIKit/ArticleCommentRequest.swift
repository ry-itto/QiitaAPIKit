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
        typealias Response = [ArticleComment]

        let id: String

        var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/comments"
        }
        var queryItems: [URLQueryItem]?
    }
}

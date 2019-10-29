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
        typealias Request = ArticleLike.Request
        typealias Response = [ArticleLike.Response]

        let id: String

        var requestURLString: String {
            return "https://qiita.com/api/v2/items/\(id)/likes"
        }
        var requestQueryItem: ArticleLike.Request = ArticleLike.Request()
    }
}

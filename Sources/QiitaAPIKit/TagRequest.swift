//
//  TagRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/06.
//

import Foundation

public extension QiitaAPIKit {

    /// Qiita API v2 tags API
    /// document: https://qiita.com/api/v2/docs#get-apiv2tags
    struct TagRequest: RequestType {
        typealias Request = Tag.Request
        typealias Response = [Tag.Response]

        var requestURLString: String {
            return "https://qiita.com/api/v2/tags"
        }
        var requestQueryItem: Tag.Request {
            return Tag.Request()
        }
    }
}

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
        public typealias Request = Tag.Request
        public typealias Response = [Tag.Response]

        public var requestURLString: String {
            return "https://qiita.com/api/v2/tags"
        }
        public var requestQueryItem: Tag.Request

        public init(requestQueryItem: Request = Request()) {
            self.requestQueryItem = requestQueryItem
        }
    }
}

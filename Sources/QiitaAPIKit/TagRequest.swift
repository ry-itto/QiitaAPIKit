//
//  TagRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/06.
//

import Foundation


/// Qiita API v2 tags API
/// document: https://qiita.com/api/v2/docs#get-apiv2tags
public struct TagRequest: RequestType {
    public typealias Request = Tag.Request
    public typealias Response = [Tag.Response]

    public var requestURLString: String {
        return "https://qiita.com/api/v2/tags"
    }
    public var requestQueryItem: Tag.Request

    public var httpMethod: HttpMethod = .GET

    public var accessToken: String?

    public init(accessToken: String? = nil, requestQueryItem: Request = Request()) {
        self.accessToken = accessToken
        self.requestQueryItem = requestQueryItem
    }
}

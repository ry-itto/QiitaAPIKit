//
//  AccessTokenRequest.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/11/15.
//

struct AccessTokenRequest: RequestType {
    internal typealias Request = AccessToken.Request
    internal typealias Response = AccessToken.Response

    internal var requestURLString: String {
        return "https://qiita.com/api/v2/access_tokens"
    }
    internal var requestQueryItem: AccessToken.Request

    internal var httpMethod: HttpMethod = .POST

    internal var accessToken: String?

    internal init(requestQueryItem: Request) {
        self.requestQueryItem = requestQueryItem
    }
}

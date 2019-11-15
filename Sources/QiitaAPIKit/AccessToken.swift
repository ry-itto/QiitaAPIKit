//
//  AccessToken.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/11/15.
//

import Foundation

public enum AccessToken {
    internal struct Request: RequestQueryItem {
        public let clientID: String
        public let clientSecret: String
        public let code: String

        public init(clientID: String, clientSecret: String, code: String) {
            self.clientID = clientID
            self.clientSecret = clientSecret
            self.code = code
        }

        public func isValidParameters() -> Bool {
            return !clientID.isEmpty
                && !clientSecret.isEmpty
                && !code.isEmpty
        }

        public func queryItems() -> [URLQueryItem] {
            return [
                URLQueryItem(name: "client_id", value: clientID),
                URLQueryItem(name: "client_secret", value: clientSecret),
                URLQueryItem(name: "code", value: code)
            ]
        }
    }

    struct Response: Decodable {
        let clientId: String
        let scopes: [String]
        let token: String
    }
}

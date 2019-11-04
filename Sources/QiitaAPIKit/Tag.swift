//
//  Tag.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/06.
//

import Foundation

public enum Tag {
    public struct Request: RequestQueryItem {
        public enum SortType: String {
            case count
            case name
        }

        public var page: Int
        public var perPage: Int
        public var sort: SortType

        public init(page: Int = 1, perPage: Int = 20, sort: SortType = .count) {
            self.page = page
            self.perPage = perPage
            self.sort = sort
        }

        public func isValidParameters() -> Bool {
            return (1...100).contains(page)
                && (1...100).contains(perPage)
        }

        public func queryItems() -> [URLQueryItem] {
            return [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "perPage", value: "\(perPage)"),
                URLQueryItem(name: "sort", value: sort.rawValue)
            ]
        }
    }

    public struct Response: Decodable {
        public let followersCount: Int
        public let iconURL: URL?
        public let id: String
        public let itemsCount: Int

        enum CodingKeys: String, CodingKey {
            case followersCount
            case iconURL = "iconUrl"
            case id
            case itemsCount
        }
    }

}

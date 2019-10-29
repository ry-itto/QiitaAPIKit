//
//  Tag.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/06.
//

import Foundation

public enum Tag {
    public struct Request: RequestQueryItem {
        enum SortType: String {
            case count
            case name
        }

        let page: Int = 1
        let perPage: Int = 20
        let sort: SortType = .count

        func queryItems() -> [URLQueryItem] {
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

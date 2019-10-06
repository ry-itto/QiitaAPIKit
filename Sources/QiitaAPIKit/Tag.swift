//
//  Tag.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/06.
//

import Foundation

public struct Tag: Decodable {
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

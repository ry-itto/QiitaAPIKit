//
//  User.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/13.
//

import Foundation

public struct User: Decodable {
    public let description: String?
    public let facebookId: String?
    public let followeesCount: Int
    public let followersCount: Int
    public let githubLoginName: String?
    public let id: String
    public let itemsCount: Int
    public let linkedinId: String?
    public let location: String?
    public let name: String
    public let organization: String?
    public let permanentId: Int
    public let profileImageUrl: URL?
    public let teamOnly: Bool
    public let twitterScreenName: String?
    public let websiteUrlString: String?

    var websiteUrl: URL? {
        guard let string = websiteUrlString,
            !string.isEmpty else {
                return nil
        }
        return URL(string: string)
    }

    enum CodingKeys: String, CodingKey {
        case description
        case facebookId
        case followeesCount
        case followersCount
        case githubLoginName
        case id
        case itemsCount
        case linkedinId
        case location
        case name
        case organization
        case permanentId
        case profileImageUrl
        case teamOnly
        case twitterScreenName
        case websiteUrlString = "website_url"
    }
}

//
//  Article.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/09/09.
//

import Foundation

/// Qiita記事モデル
public struct Article: Decodable {
    public let renderedBody: String
    public let body: String
    public let coediting: Bool
    public let createdAt: Date
    public let group: Group?
    public let id: String
    public let likesCount: Int
    public let isPrivate: Bool
    public let reactionsCount: Int
    public let tags: [Tag]
    public let title: String
    public let updatedAt: Date
    public let url: URL
    public let user: User
    public let pageViewsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case renderedBody
        case body
        case coediting
        case createdAt
        case group
        case id
        case likesCount
        case isPrivate = "private"
        case reactionsCount
        case tags
        case title
        case updatedAt
        case url
        case user
        case pageViewsCount
    }
}

public struct Group: Decodable {
    public let createdAt: Date
    public let id: Int
    public let name: String
    public let isPrivate: Bool
    public let updatedAt: Date
    public let urlName: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case id
        case name
        case isPrivate = "private"
        case updatedAt
        case urlName
    }
}

public struct Tag: Decodable {
    public let name: String
    public let versions: [String]
}

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

//
//  ArticleLike.swift
//  
//
//  Created by 伊藤凌也 on 2019/10/12.
//

import Foundation

public struct ArticleLike: Decodable {
    public let createdAt: Date
    public let user: User
}

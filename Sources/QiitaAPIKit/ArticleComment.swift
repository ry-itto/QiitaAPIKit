//
//  ArticleComment.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/10/03.
//

import Foundation

public struct ArticleComment: Decodable {
    let body: String
    let createdAt: Date
    let id: String
    let renderedBody: String
    let updatedAt: Date
    let user: User
}
//
//  ArticleCommentsRequestTest.swift
//  QiitaAPIKitTests
//
//  Created by 伊藤凌也 on 2019/10/03.
//

import XCTest
import OHHTTPStubs
@testable import QiitaAPIKit

final class ArticleCommentsRequestTest: XCTestCase {

    let articleID = "c03700e7a56a8bbff93e"

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    func test_fetchArticleCommentsAlive() {
        let exp = expectation(description: "Target host is alive")
        QiitaAPIKit.ArticleCommentRequest(id: articleID).request { result in
            switch result {
            case .success:
                exp.fulfill()
            case .failure(let e):
                XCTFail(e.localizedDescription)
            }
        }

        wait(for: [exp], timeout: 5.0)

        sleep(2)
    }

    func test_fetchArticles_DecodeSuccess() {

        guard let stubPath = OHPathForFile("GET_article_comments.json", type(of: self)) else {
            fatalError("Can't find 'GET_article_comments.json in this bundle'")
        }
        stub(condition: isHost("qiita.com") && isPath("/api/v2/items/\(articleID)/comments")) { _ in
            return fixture(filePath: stubPath, headers: nil)
        }

        let exp = expectation(description: "Success to decode")
        QiitaAPIKit.ArticleCommentRequest(id: articleID).request { result in
            switch result {
            case .success(let response):
                XCTAssert(response.count == 1)
                exp.fulfill()
            case .failure:
                XCTFail("failed to decode...")
            }
        }

        wait(for: [exp], timeout: 5.0)
    }
}

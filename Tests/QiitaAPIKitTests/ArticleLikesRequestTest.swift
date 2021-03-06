//
//  ArticleLikesRequestTest.swift
//  QiitaAPIKitTests
//
//  Created by 伊藤凌也 on 2019/10/13.
//

import XCTest
import OHHTTPStubs
@testable import QiitaAPIKit

class ArticleLikesRequestTest: XCTestCase {

    let articleID = "c03700e7a56a8bbff93e"

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    func test_fetchArticleLikesAlive() {
        let exp = expectation(description: "Target host is alive")
        ArticleLikesRequest(id: articleID).request { result in
            switch result {
            case .success:
                exp.fulfill()
            case .failure:
                break
            }
        }

        wait(for: [exp], timeout: 5.0)

        sleep(2)
    }

    func test_fetchArticleTags_DecodeSuccess() {

        guard let stubPath = OHPathForFile("GET_likes.json", type(of: self)) else {
            fatalError("Can't find 'GET_likes.json in this bundle'")
        }
        stub(condition: isHost("qiita.com") && isPath("/api/v2/items/\(articleID)/likes")) { _ in
            return fixture(filePath: stubPath, headers: nil)
        }

        let exp = expectation(description: "Success to decode")
        ArticleLikesRequest(id: articleID).request { result in
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

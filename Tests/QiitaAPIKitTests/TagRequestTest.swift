//
//  TagRequestTest.swift
//  QiitaAPIKitTests
//
//  Created by 伊藤凌也 on 2019/10/07.
//

import XCTest
import OHHTTPStubs
@testable import QiitaAPIKit

class TagRequestTest: XCTestCase {

    let apiKit = QiitaAPIKit()

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    func test_fetchTagsAlive() {
        let exp = expectation(description: "Target host is alive")
        apiKit.fetchTags { result in
            switch result {
            case .success:
                exp.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [exp], timeout: 5.0)

        sleep(2)
    }

    func test_fetchTags_DecodeSuccess() {

        guard let stubPath = OHPathForFile("GET_tags.json", type(of: self)) else {
            fatalError("Can't find 'GET_tags.json in this bundle'")
        }
        stub(condition: isHost("qiita.com") && isPath("/api/v2/tags")) { _ in
            return fixture(filePath: stubPath, headers: nil)
        }

        let exp = expectation(description: "Success to decode")
        apiKit.fetchTags { result in
            switch result {
            case .success(let tags):
                XCTAssert(tags.count == 1)
                exp.fulfill()
            case .failure:
                XCTFail()
            }
        }

        wait(for: [exp], timeout: 5.0)
    }

    func test_fetchTags_PageOutOfRange() {
        apiKit.fetchTags(page: 0) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure:
                break
            }
        }
    }
}

import XCTest
import OHHTTPStubs
import Foundation
@testable import QiitaAPIKit

final class ArticleRequestTest: XCTestCase {

    override func setUp() {
        guard let stubPath = OHPathForFile("GET_items.json", type(of: self)) else {
            fatalError("Can't find 'GET_items.json in this bundle'")
        }
        stub(condition: isHost("qiita.com") && isPath("/api/v2/items") && containsQueryParams(["query": "decodeSuccess"])) { _ in
            return fixture(filePath: stubPath, headers: nil)
        }
    }

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    func test_fetchArticlesAlive() {
        let exp = expectation(description: "Target host is alive")
        QiitaAPIKit.ArticleRequest(requestQueryItem: Article.Request(query: "alive?")).request { result in
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

    func test_fetchArticles_DecodeSuccess() {
        let exp = expectation(description: "Success to decode")
        QiitaAPIKit.ArticleRequest(requestQueryItem: Article.Request(query: "decodeSuccess")).request { result in
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

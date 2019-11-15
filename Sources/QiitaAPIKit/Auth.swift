//
//  Auth.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/11/10.
//

import Foundation
import UIKit
import WebKit

public extension QiitaAPIKit {
    class Auth: NSObject {
        private let clientID: String
        private let clientSecret: String
        private let scope: String
        private let redirectURLString: String

        public weak var delegate: QiitaAPIKitAuthDelegate?

        public init(clientID: String, clientSecret: String, redirectURLString: String, scope: [Scope]) {
            self.clientID = clientID
            self.clientSecret = clientSecret
            self.redirectURLString = redirectURLString
            self.scope = scope.map { $0.rawValue }.joined(separator: " ")
        }

        private var authorizeURL: URL {
            var urlComponents = URLComponents(string: "https://qiita.com/api/v2/oauth/authorize")
            urlComponents?.queryItems = [
                URLQueryItem(name: "client_id", value: clientID),
                URLQueryItem(name: "client_secret", value: clientSecret),
                URLQueryItem(name: "scope", value: scope)
            ]

            guard let url = urlComponents?.url else {
                fatalError("query items are not valid")
            }

            return url
        }

        public func showLoginView() -> Void {
            let vc = WebViewController(url: authorizeURL)
            vc.webView.navigationDelegate = self
            delegate?.present(loginView: vc)
        }

        private func fetchAccessToken(from redirecrtURL: URL, completion: @escaping (Result<AccessToken.Response, Error>) -> Void) {
            let components = URLComponents(string: redirecrtURL.absoluteString)
            guard let code = components?.queryItems?.first(where: { $0.name == "code" })?.value else {
                completion(.failure(APIError.DataIsNotFetched))
                return
            }
            let accessTokenRequest = AccessTokenRequest(requestQueryItem: .init(clientID: clientID, clientSecret: clientSecret, code: code))
            accessTokenRequest.request { result in
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

public protocol QiitaAPIKitAuthDelegate: class {
    func present(loginView: UIViewController)
    func dismissLoginView()
    func fetchedAccessToken(accessToken: String?, error: Error?)
}

extension QiitaAPIKit.Auth: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let redirectURL = webView.url,
            webView.url?.absoluteString.contains(redirectURLString) ?? false {
            decisionHandler(.cancel)
            fetchAccessToken(from: redirectURL) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.delegate?.fetchedAccessToken(accessToken: response.token, error: nil)
                case .failure(let error):
                    self?.delegate?.fetchedAccessToken(accessToken: nil, error: error)
                }
            }
            delegate?.dismissLoginView()
        } else {
            decisionHandler(.allow)
        }
    }

    public enum Scope: String {
        case readQiita = "read_qiita"
        case readQiitaTeam = "read_qiita_team"
        case writeQiita = "write_qiita"
        case writeQiitaTeam = "write_qiita_team"
    }
}

fileprivate class WebViewController: UIViewController {
    let url: URL
    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
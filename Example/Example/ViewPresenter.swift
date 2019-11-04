//
//  ViewPresenter.swift
//  Example
//
//  Created by 伊藤凌也 on 2019/10/01.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import QiitaAPIKit

class ViewPresenter {

    private(set) var items: [Article.Response] = []

    weak var viewController: ViewProtocol?

    init(_ viewController: ViewProtocol) {
        self.viewController = viewController

        QiitaAPIKit.ArticleRequest(requestQueryItem: .init(query: "ios")).request { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                self?.viewController?.reloadData()
            case .failure:
                self?.viewController?.showErrorMessage()
            }
        }
    }
}

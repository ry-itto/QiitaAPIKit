//
//  ViewModel.swift
//  Example_SwiftUI
//
//  Created by 伊藤凌也 on 2019/11/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import QiitaAPIKit
import Combine

final class ViewModel: ObservableObject {
    private var cancellables: [AnyCancellable] = []

    // Input
    enum Input {
        case onAppear
    }
    let onAppearSubject = PassthroughSubject<Void, Never>()

    // Output
    @Published private(set) var articles: QiitaAPIKit.ArticleRequest.Response = []
    private let articleSubject = PassthroughSubject<QiitaAPIKit.ArticleRequest.Response, Error>()

    init() {
        onAppearSubject
            .setFailureType(to: Error.self)
            .flatMap { QiitaAPIKit.ArticleRequest(requestQueryItem: .init(query: "iOS")).publisher }
            .share()
            .subscribe(articleSubject)
            .store(in: &cancellables)

        articleSubject
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.articles, on: self)
            .store(in: &cancellables)
    }
}

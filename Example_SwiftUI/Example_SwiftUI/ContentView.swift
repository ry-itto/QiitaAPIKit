//
//  ContentView.swift
//  Example_SwiftUI
//
//  Created by 伊藤凌也 on 2019/11/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            ForEach(viewModel.articles) { article in
                Row(title: article.title, likesCount: "\(article.likesCount)")
                    .padding(.horizontal, 20)
                Divider()
            }
        }
        .onAppear {
            self.viewModel.onAppearSubject.send(())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}

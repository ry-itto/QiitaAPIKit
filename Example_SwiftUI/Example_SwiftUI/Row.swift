//
//  Row.swift
//  Example_SwiftUI
//
//  Created by 伊藤凌也 on 2019/11/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct Row: View {
    let title: String
    let likesCount: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .bold()
                    .lineLimit(3)
            }
            Spacer()
            VStack {
                Image(systemName: "hand.thumbsup.fill")
                Text(likesCount)
            }
            .foregroundColor(.green)
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(title: "hoge", likesCount: "100")
            .previewLayout(.fixed(width: 300, height: 50))
    }
}

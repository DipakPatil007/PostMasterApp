//
//  PostDetailView.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    let isFavorite: Bool
    let onFavoriteTapped: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Button(action: onFavoriteTapped) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .imageScale(.large)
                }
                .buttonStyle(.borderless)
            }

            Text(post.body)
                .font(.body)

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

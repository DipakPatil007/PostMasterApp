//
//  PostRowView.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    let isFavorite: Bool
    let onFavoriteTapped: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(2)
                Text("User: \(post.userId)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: onFavoriteTapped) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .imageScale(.large)
                    .accessibilityLabel(isFavorite ? "Unmark favorite" : "Mark favorite")
            }
            .buttonStyle(.borderless)
        }
        .padding(.vertical, 8)
    }
}

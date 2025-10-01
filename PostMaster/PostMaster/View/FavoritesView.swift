//
//  FavoritesView.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//
import SwiftUI

struct FavoritesView: View {
    @ObservedObject var vm: PostsViewModel

    var body: some View {
        Group {
            if vm.isLoading {
                VStack { Spacer(); ProgressView("Loading..."); Spacer() }
            } else {
                if vm.favoritePosts.isEmpty {
                    VStack(spacing: 12) {
                        Text("No favorites yet").font(.headline)
                        Text("Mark posts as favorite using the heart button")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                } else {
                    List(vm.favoritePosts) { post in
                        NavigationLink(value: post) {
                            PostRowView(post: post, isFavorite: vm.isFavorite(post)) {
                                vm.toggleFavorite(post)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .refreshable { await vm.refresh() }
                    .navigationDestination(for: Post.self) { post in
                        PostDetailView(post: post, isFavorite: vm.isFavorite(post)) {
                            vm.toggleFavorite(post)
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorites")
        .task { if vm.posts.isEmpty { await vm.fetchPosts() } }
        .alert("Error", isPresented: $vm.showErrorAlert, presenting: vm.errorMessage) { _ in
            Button("OK", role: .cancel) { }
        } message: { message in
            Text(message)
        }
    }
}


//
//  PostsListView.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

struct PostsListView: View {
    @ObservedObject var vm: PostsViewModel

    var body: some View {
        VStack(spacing: 0) {
            SearchBar(text: $vm.searchText)
                .padding([.leading, .trailing, .top])

            if vm.isLoading {
                VStack { Spacer(); ProgressView("Loading posts..."); Spacer() }
            } else {
                List(vm.filteredPosts) { post in
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
        .navigationTitle("Posts")
        .task { if vm.posts.isEmpty { await vm.fetchPosts() } }
        .alert("Error", isPresented: $vm.showErrorAlert, presenting: vm.errorMessage) { _ in
            Button("OK", role: .cancel) { }
        } message: { message in
            Text(message)
        }
    }
}

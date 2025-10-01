//
//  PostsViewModel.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

@MainActor
final class PostsViewModel: ObservableObject {
    @Published private(set) var posts: [Post] = []
    @Published var searchText: String = ""
    @Published private(set) var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var showErrorAlert: Bool = false

    // Favorites by post id
    @Published private(set) var favorites: Set<Int> = [] {
        didSet { saveFavorites() }
    }

    private let repository = PostsRepository()
    private let favoritesKey = "favorites_post_ids_v1"

    init() {
        loadFavorites()
    }

    var filteredPosts: [Post] {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else { return posts }
        let lower = searchText.lowercased()
        return posts.filter { $0.title.lowercased().contains(lower) }
    }

    var favoritePosts: [Post] {
        posts.filter { favorites.contains($0.id) }
    }
    func fetchPosts() async {
        isLoading = true
        errorMessage = nil
        do {
            let data = try await repository.getPosts()
            posts = data
        } catch is CancellationError {
            // Pull-to-refresh was cancelled, ignore silently
            print("Fetch cancelled — ignoring")
        } catch {
            if let apiErr = error as? APIService.APIError {
                errorMessage = apiErr.errorDescription
            } else {
                errorMessage = error.localizedDescription
            }
            showErrorAlert = true
        }
        isLoading = false
    }

    func refresh() async {
        await fetchPosts()
    }

    // Favorites management
    func isFavorite(_ post: Post) -> Bool {
        favorites.contains(post.id)
    }
    func toggleFavorite(_ post: Post) {
        if favorites.contains(post.id) {
            favorites.remove(post.id)
        } else {
            favorites.insert(post.id)
        }
    }
    private func saveFavorites() {
        let arr = Array(favorites)
        UserDefaults.standard.set(arr, forKey: favoritesKey)
    }
    func loadFavorites() {
        if let arr = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] {
            favorites = Set(arr)
        }
    }
}

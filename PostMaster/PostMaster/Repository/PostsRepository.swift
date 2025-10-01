//
//  PostsRepository.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import Foundation

final class PostsRepository {
    private let api = APIService.shared

    func getPosts() async throws -> [Post] {
        return try await api.fetchPosts()
    }
}

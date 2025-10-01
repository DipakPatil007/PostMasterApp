//
//  APIService.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}

    enum APIError: LocalizedError {
        case invalidURL
        case statusCode(Int)
        case decodingError
        case unknown(Error)

        var errorDescription: String? {
            switch self {
                case .invalidURL: return "Invalid URL"
                case .statusCode(let code): return "Bad status code: \(code)"
                case .decodingError: return "Failed to decode response"
                case .unknown(let err): return err.localizedDescription
            }
        }
    }

    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw APIError.invalidURL
        }

        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            // Ignore user-initiated cancellation
            if (error as? URLError)?.code == .cancelled || error is CancellationError {
                // Just silently throw CancellationError
                throw CancellationError()
            }
            throw APIError.unknown(error)
        }

        if let http = response as? HTTPURLResponse, http.statusCode != 200 {
            throw APIError.statusCode(http.statusCode)
        }

        do {
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return posts
        } catch {
            throw APIError.decodingError
        }
    }
}

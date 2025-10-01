//
//  Post.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

struct Post: Identifiable, Codable, Equatable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

//
//  MainTabView.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var vm = PostsViewModel() // shared ViewModel

    var body: some View {
        TabView {
            NavigationStack {
                PostsListView(vm: vm)
            }
            .tabItem {
                Label("Posts", systemImage: "list.bullet")
            }

            NavigationStack {
                FavoritesView(vm: vm)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
    }
}

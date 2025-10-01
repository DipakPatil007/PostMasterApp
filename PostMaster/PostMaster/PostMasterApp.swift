//
//  PostMasterApp.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI
import SwiftData

@main
struct PostMasterApp: App {
    // model container for swiftData
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SpalshScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}

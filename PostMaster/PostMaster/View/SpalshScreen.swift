//
//  SpalshScreen.swift
//  PostMaster
//
//  Created by AressMacMiniA1993 on 01/10/25.
//

import SwiftUI


struct SpalshScreen: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                MainTabView()
            } else {
                VStack(spacing: 20) {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Text("Posts App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation { isActive = true }
                    }
                }
            }
        }
    }
}

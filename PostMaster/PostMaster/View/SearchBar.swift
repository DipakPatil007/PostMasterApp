//
//  SearchBar.swift
//  PostMaster
//
//  Created by Dipak Patil on 01/10/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search by title...", text: $text)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.none)
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(.borderless)
            }
        }
        .padding(10)
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

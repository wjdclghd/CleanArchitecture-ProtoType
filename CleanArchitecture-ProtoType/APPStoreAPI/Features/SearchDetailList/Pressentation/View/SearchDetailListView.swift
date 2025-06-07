//
//  SearDetailListView.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import SwiftUI

struct SearchDetailListView: View {
    @ObservedObject var viewModel: SearchDetailListViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("앱 이름 검색", text: $viewModel.searchQuery)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if viewModel.isLoading {
                    ProgressView("검색 중...")
                        .padding()
                }

                List(viewModel.searchResults, id: \ .id) { app in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(app.trackName ?? "앱 이름 없음")
                            .font(.headline)
                        Text(app.artistName ?? "개발사 정보 없음")
                            .font(.subheadline)
                        if let rating = app.averageUserRating {
                            Text("⭐️ 평점: \(rating, specifier: "%.1f")")
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.plain)
            }
            .navigationTitle("앱스토어 검색")
        }
    }
}

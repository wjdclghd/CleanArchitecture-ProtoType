//
//  SearchListView.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation
import SwiftUI

struct SearchListView: View {
    @ObservedObject var viewModel: SearchListViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        VStack {
            TextField("검색어를 입력하세요", text: $viewModel.searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    let trimmed = viewModel.searchQuery.trimmingCharacters(in: .whitespaces)
                    guard !trimmed.isEmpty else { return }
                    
                    viewModel.saveKeyword(trimmed)
                    viewModel.touchKeyword(trimmed)
                    
                    coordinator.push(.searchDetailList(searchKeyword: trimmed))
                }

            List(viewModel.searchList, id: \.searchKeyword) { item in
                Button {
                    viewModel.touchKeyword(item.searchKeyword)
                    coordinator.push(.searchDetailList(searchKeyword: item.searchKeyword))
                } label: {
                    Text(item.searchKeyword)
                }
            }
        }
        .navigationTitle("검색 기록")
    }
}

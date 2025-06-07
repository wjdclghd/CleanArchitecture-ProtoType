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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("검색어를 입력하세요", text: $viewModel.searchQuery)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .onSubmit {
                        let trimmed = viewModel.searchQuery.trimmingCharacters(in: .whitespaces)
                        guard !trimmed.isEmpty else { return }
                        
                        viewModel.saveKeyword(trimmed)
                        viewModel.touchKeyword(trimmed)
                        viewModel.searchQuery = ""
                    }

                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }

                List {
                    ForEach(viewModel.searchList, id: \.searchKeyWord) { item in
                        NavigationLink(
                            destination: {
                                // ✅ 목적지: SearchDetailListView 생성
                                let searchDetailListRepository = SearchDetailListRepository()
                                let searchDetailListUseCase = SearchDetailListUseCase(repository: searchDetailListUseCase)
                                let searchDetailListViewModel = SearchDetailListViewModel(useCase: searchDetailListUseCase)
                                SearchDetailListViewModel.searchDetailList(for: item.searchKeyWord) // 즉시 호출
                                
                                SearchDetailListView(viewModel: SearchDetailListViewModel)
                            }
                        ) {
                            HStack {
                                Text(item.searchKeyWord)
                                Spacer()
                                Button {
                                    viewModel.deleteKeyword(item.searchKeyWord)
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                Button(action: {
                    viewModel.clearAllList()
                }) {
                    Text("전체 삭제")
                        .foregroundColor(.red)
                }
                .padding(.bottom)
            }
            .navigationTitle("검색 기록")
        }
    }
}

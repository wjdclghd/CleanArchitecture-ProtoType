//
//  SearchListView.swift
//  CleanArchitecture-ProtoType
//
//  Created by 201510089 on 5/6/25.
//

import SwiftUI

struct SearchListView: View {
    @ObservedObject var viewModel: SearchListViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            // 검색창
            TextField("검색어를 입력하세요", text: $viewModel.searchQuery)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .onSubmit {
                    let trimmed = viewModel.searchQuery.trimmingCharacters(in: .whitespaces)
                    guard !trimmed.isEmpty else { return }
                    
                    viewModel.saveKeyword(trimmed)       // 저장
                    viewModel.touchKeyword(trimmed)      // 최근 검색어로 갱신 (timestamp 업데이트)
                    viewModel.searchQuery = ""           // 입력 필드 초기화 (선택)
                }
            
            // 로딩 표시
            if viewModel.isLoading {
                ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
            }
                      
            // 검색어 리스트
            List {
                ForEach(viewModel.searchList, id: \.searchKeyWord) { item in
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
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // 최근 검색어 선택 시 갱신
                        viewModel.touchKeyword(item.searchKeyWord)
                    }
                }
            }
            .listStyle(.plain)
            
            // 전체 삭제 버튼
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

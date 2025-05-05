//
//  CleanArchitecture-ProtoTypeApp.swift
//  CleanArchitecture-ProtoType
//
//  Created by 201510089 on 5/6/25.
//

import SwiftUI

@main
struct CleanArchitecture_ProtoTypeApp: App {
    // UIKit AppDelegate 연동
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            // DI 구성
            let database = try! SearchListDatabase()
            let repository = SearchListRepository(searchListDatabase: database)
            let useCase = SearchListUseCase(repository: repository)
            let viewModel = SearchListViewModel(useCase: useCase)

            // SwiftUI 루트 화면
            SearchListView(viewModel: viewModel)
        }
    }
}

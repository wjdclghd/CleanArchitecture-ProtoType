//
//  NavigationCoordinator.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation
import SwiftUI

final class NavigationCoordinator: NavigationCoordinatorProtocol {
    typealias Route = AppRoute
    
    @Published var path = NavigationPath()
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func build(route: AppRoute) -> AnyView {
        switch route {
        case .searchDetailList(let searchKeyword):
            let repository: SearchDetailListRepositoryProtocol = SearchDetailListRepository()
            let useCase: SearchDetailListUseCaseProtocol = SearchDetailListUseCase(repository: repository)
            let viewModel = SearchDetailListViewModel(useCase: useCase, searchKeyword: searchKeyword)
            
            return AnyView(SearchDetailListView(viewModel: viewModel))
        }
    }
}

//
//  NavigationCoordinator.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation
import SwiftUI

protocol NavigationCoordinatorProtocol: ObservableObject {
    associatedtype Route: Hashable
    
    var path: NavigationPath { get set }
    func push(_ route: Route)
    func pop()
    func popToRoot()
}

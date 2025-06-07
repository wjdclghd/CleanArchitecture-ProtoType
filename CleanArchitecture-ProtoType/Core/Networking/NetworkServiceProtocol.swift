//
//  NetworkServiceProtocol.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable & Sendable>(_ endpoint: APIEndpoint, type: T.Type) -> AnyPublisher<T, NetworkError>
}

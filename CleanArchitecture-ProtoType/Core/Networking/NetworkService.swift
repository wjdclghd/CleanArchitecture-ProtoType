//
//  NetworkService.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation
import Combine
import Alamofire

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable & Sendable>(_ endpoint: APIEndpoint, type: T.Type) -> AnyPublisher<T, NetworkError> {
        AF.request(endpoint.urlRequest)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError {
                NetworkError.basic($0)
            }
            .eraseToAnyPublisher()
    }
}

//
//  APIService.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine
import Alamofire

enum APIService {
    static func searchDetailList() -> AnyPublisher<[SearchDetailListEntity], Error> {
        return AF.request(API.searchDetailList.url)
            .publishDecodable(type: [SearchDetailListEntity].self)
            .value()
            .mapError{(resultError: AFError) in
                return resultError as Error
            }
            .eraseToAnyPublisher()
    }
}

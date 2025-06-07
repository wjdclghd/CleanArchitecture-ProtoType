//
//  NetworkError.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation
import Combine
import Alamofire

enum NetworkError: Error {
    case invalidError
    case decodingError
    case basic(Error)
}

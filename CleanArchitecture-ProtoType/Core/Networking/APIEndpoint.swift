//
//  APIEndpoint.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation

enum HTTPMethodType: String {
    case get = "GET"
    case post = "POST"
}

enum APIEndpoint {
    case searchDetailList(searchKeyword: String)
    
    var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        switch self {
        case .searchDetailList:
            return "/search"
        }
    }
    
    var method: HTTPMethodType {
        switch self {
        case .searchDetailList:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .searchDetailList(let searchKeyword):
            return [
                URLQueryItem(name: "term", value: searchKeyword),
                URLQueryItem(name: "media", value: "software"),
                URLQueryItem(name: "country", value: "KR")
            ]
        }
    }
    
    var urlRequest: URLRequest {
        var components = URLComponents(string: baseURL + path)!
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }
}

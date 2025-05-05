//
//  API.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

enum API {
    case searchDetailList
    
    var url: URL {
        switch self {
        case .searchDetailList:
            return URL(string: "https://itunes.apple.com/search")!
        }
    }
}

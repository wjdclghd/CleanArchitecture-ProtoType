//
//  SearchDetailListInterface.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

protocol SearchDetailListInterface {
    func searchDetailListInterface(completion: @escaping ([SearchDetailListEntity]) -> Void)
}

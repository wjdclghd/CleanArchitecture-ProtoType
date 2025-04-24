//
//  SearchListInterface.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

protocol SearchListInterface {
    func insertSearchListInterface(completion: @escaping ([SearchListEntity]) -> Void)
    
    func deleteSearchListInterface(completion: @escaping ([SearchListEntity]) -> Void)
}

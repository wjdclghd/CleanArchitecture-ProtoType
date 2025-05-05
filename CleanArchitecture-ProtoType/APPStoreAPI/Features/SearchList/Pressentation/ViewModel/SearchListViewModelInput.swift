//
//  SearchListViewModelInput.swift
//  CleanArchitecture-ProtoType
//
//  Created by 201510089 on 5/6/25.
//

import Foundation

protocol SearchListViewModelInput {
    var searchQuery: String { get set }
    
    func filterList()
    func saveKeyword(_ keyword: String)
    func deleteKeyword(_ keyword: String)
    func clearAllList()
    func loadAllList()
    func touchKeyword(_ keyword: String)
}

//
//  SearchListViewModelInput.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation

protocol SearchListViewModelInput {
    var searchQuery: String { get set }
    
    func filterList()
    func saveKeyword(_ searchKeyword: String)
    func deleteKeyword(_ searchKeyword: String)
    func clearAllList()
    func loadAllList()
    func touchKeyword(_ searchKeyword: String)
}

//
//  SearchListViewModelOutput.swift
//  CleanArchitecture-ProtoType
//
//  Created by 201510089 on 5/6/25.
//

import Foundation
import Combine

protocol SearchListViewModelOutput {
    var searchListPublisher: Published<[SearchListEntity]>.Publisher { get }
    var isLoadingPublisher: Published<Bool>.Publisher { get }
}

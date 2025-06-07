//
//  SearchListViewModelOutput.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation
import Combine

protocol SearchListViewModelOutput {
    var searchListPublisher: Published<[SearchListEntity]>.Publisher { get }
    var isLoadingPublisher: Published<Bool>.Publisher { get }
}

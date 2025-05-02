//
//  SearchListDatabase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/22/25.
//

import Foundation
import RealmSwift
import Combine

//static func searchDetailList() -> AnyPublisher<[SearchDetailListEntity], Error> {
//    return AF.request(API.searchDetailList.url)
//        .publishDecodable(type: [SearchDetailListEntity].self)
//        .value()
//        .mapError{(resultError: AFError) in
//            return resultError as Error
//        }
//        .eraseToAnyPublisher()
//}

class SearchListDatabase {
    let realmDatabase = try! Realm()
    
    func insertDataTest() -> AnyPublisher<[SearchListEntity], Error> {
        return Future<[SearchListEntity], Error> { completion in
                do {
                    try! realmDatabase.write {
                        let query = SearchListEntityMapping(name: UUID().uuidString, searchKeyWord: "테스트 키워드")
                        
                        realmDatabase.add(query)
                        realmDatabase.add(query, update: .modified)
                    }

                    let realmResults = realm.objects(SearchListEntityMapping.self)
                    let entities = realmResults.map { $0.toEntity() }
                    completion(.success(Array(entities)))

                } catch {
                    completion(.failure(error))
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func insertData(entity: SearchListEntity) {
        try! realmDatabase.write {
            let query = SearchListEntityMapping(name: "", searchKeyWord: entity.searchKeyWord)
            
            realmDatabase.add(query)
        }
    }
    
    func deleteAllData() {
        try! realmDatabase.write {
            realmDatabase.deleteAll()
        }
    }

//    func deleteData(entity: SearchListEntity) {
//        try! realmDatabase.write {
//            realmDatabase.delete(realmDatabase.objects(SearchListEntity.self).filter("searchKeyWord = '\(searchKeyWord)'"))
//        }
//    }
//    
//    func updateData(searchRealm: SearchListEntity, searchKeyWord: String) {
//        try! realmDatabase.write {
//            searchRealm.searchKeyWord = searchKeyWord
//        }
//    }
//    
//    func selectData(searchKeyWord: String) -> Results<SearchListEntity> {
//        let reault = realmDatabase.objects(ofType: SearchListEntity.self).filter("searchKeyWord CONTAINS[c] '\(searchKeyWord)'")
//        
//        return reault
//    }
//    
//    func selectAllData() -> Results<SearchListEntity> {
//        let result = realmDatabase.objects(SearchListEntity.self)
//        
//        return result
//    }
}

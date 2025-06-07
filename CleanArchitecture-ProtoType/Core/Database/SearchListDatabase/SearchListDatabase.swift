//
//  SearchListDatabase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/22/25.
//

import Foundation
import RealmSwift
import Combine

enum SearchError: Error {
    case invalidQuery
    case databaseError(Error)
}

class SearchListDatabase {
    private let realmDatabase: Realm
    
    init(realmDatabase: Realm) {
        self.realmDatabase = realmDatabase
    }
    
    convenience init() throws {
        let config = Realm.Configuration(
            fileURL: try DatabaseMigration.searchRealmURL(),
            schemaVersion: DatabaseMigration.currentSchemaVersion
        )
        
        self.init(realmDatabase: try Realm(configuration: config))
    }
    
    func insertDatabase(searchKeyword: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { completion in
                do {
                    try self.realmDatabase.write {
                        let entity = SearchListEntityMapping(
                            key: "SearchDatabase_\(UUID().uuidString)",
                            searchKeyWord: searchKeyword,
                            timestamp: Date()
                        )
                        
                        self.realmDatabase.add(entity, update: .modified)
                    }
                    
                    completion(.success(()))
                } catch {
                    completion(.failure(SearchError.databaseError(error)))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func deleteDatabase(searchKeyword: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { completion in
                do {
                    try self.realmDatabase.write {
                        let entity = self.realmDatabase.objects(SearchListEntityMapping.self)
                            .filter("searchKeyWord == %@", searchKeyword)
                        
                        self.realmDatabase.delete(entity)
                    }
                    
                    completion(.success(()))
                } catch {
                    completion(.failure(SearchError.databaseError(error)))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func deleteAllDatabase() -> AnyPublisher<Void, Error> {
        Deferred {
            Future { completion in
                do {
                    try self.realmDatabase.write {
                        self.realmDatabase.deleteAll()
                    }
                    
                    completion(.success(()))
                } catch {
                    completion(.failure(SearchError.databaseError(error)))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func selectDatabase(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        Just(())
            .tryMap { _ in
                let entitys = self.realmDatabase.objects(SearchListEntityMapping.self)
                    .filter("searchKeyWord CONTAINS[c] %@", searchKeyword)
                    .sorted(byKeyPath: "timestamp", ascending: false)
                return Array(entitys).map { $0.toEntity() }
            }
            .mapError { SearchError.databaseError($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func selectAllDatabase() -> AnyPublisher<[SearchListEntity], Error> {
        Just(())
            .tryMap { _ in
                let entitys = self.realmDatabase.objects(SearchListEntityMapping.self)
                    .sorted(byKeyPath: "timestamp", ascending: false)
                return Array(entitys).map { $0.toEntity() }
            }
            .mapError { SearchError.databaseError($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func updateDatabase(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        Deferred {
            Future { completion in
                do {
                    try self.realmDatabase.write {
                        let entitys = self.realmDatabase.objects(SearchListEntityMapping.self)
                            .filter("searchKeyWord == %@", searchKeyword)
                        
                        if let entity = entitys.first {
                            entity.timestamp = Date()
                        } else {
                            let newEntity = SearchListEntityMapping(
                                key: "SearchDatabase_\(UUID().uuidString)",
                                searchKeyWord: searchKeyword,
                                timestamp: Date()
                            )
                            
                            self.realmDatabase.add(newEntity, update: .modified)
                        }
                    }
                    
                    let entitys = self.realmDatabase.objects(SearchListEntityMapping.self)
                        .sorted(byKeyPath: "timestamp", ascending: false)
                    
                    let results = Array(entitys).map { $0.toEntity() }
                    
                    completion(.success(results))
                } catch {
                    completion(.failure(SearchError.databaseError(error)))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

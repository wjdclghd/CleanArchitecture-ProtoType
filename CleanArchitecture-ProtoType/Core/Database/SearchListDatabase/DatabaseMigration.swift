//
//  DatabaseMigration.swift
//  CleanArchitecture-ProtoType
//
//  Created by 201510089 on 5/5/25.
//

import Foundation
import RealmSwift

struct DatabaseMigration {
    static let currentSchemaVersion: UInt64 = 0
    
    static func searchRealmURL() throws -> URL {
        do {
            let fileManager = FileManager.default
            
            let directory = try fileManager.url(
                for: .applicationSupportDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            
            let directoryURL = directory.appendingPathComponent("SearchDatabase.realm")
            
            print("Success : SearchDatabase URL : \(directoryURL.path)")
            
            return directoryURL
        } catch {
            print("Failed : SearchDatabase URL : \(error)")
            
            throw error
        }
    }
    
    static func configuration() {
        do {
            let searchConfig = Realm.Configuration(
                fileURL: try searchRealmURL(),
                schemaVersion: currentSchemaVersion,
                migrationBlock: { migration, oldSchemaVersion in
                    
                }
            )
            
            Realm.Configuration.defaultConfiguration = searchConfig
            
            print("Success : Configuration SearchDatabase")
        } catch {
            print("Failed : Configuration SearchDatabase : \(error)")
        }
    }
}

//
//  Migrator.swift
//  GroceryApp
//
//  Created by Mohammad Azam on 5/23/22.
//

import Foundation
import RealmSwift

class Migrator {
    
    init() {
        updateSchema()
    }
    
    func updateSchema() {
        
        let config = Realm.Configuration(schemaVersion: 2) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                // add new fields
                migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
                    newObject!["items"] = List<ShoppingItem>()
                }
            }
            
            if oldSchemaVersion < 2 {
                migration.enumerateObjects(ofType: ShoppingItem.className()) { _, newObject in
                    newObject!["category"] = ""
                }
            }
            
            
        }
        
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
        
    }
    
}

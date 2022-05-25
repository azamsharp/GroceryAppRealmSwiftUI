//
//  ShoppingList.swift
//  GroceryApp
//
//  Created by Mohammad Azam on 5/23/22.
//

import Foundation
import RealmSwift

class ShoppingList: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    @Persisted var items: List<ShoppingItem> = List<ShoppingItem>() 
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}

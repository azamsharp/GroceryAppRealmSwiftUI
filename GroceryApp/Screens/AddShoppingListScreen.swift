//
//  AddShoppingListScreen.swift
//  GroceryApp
//
//  Created by Mohammad Azam on 5/23/22.
//

import SwiftUI
import RealmSwift

struct AddShoppingListScreen: View {
    
    @State private var title: String = ""
    @State private var address: String = ""
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter address", text: $address)
                
                Button {
                    
                    // create a shopping list record
                    let shoppingList = ShoppingList()
                    shoppingList.title = title
                    shoppingList.address = address
                    $shoppingLists.append(shoppingList)
                    
                    dismiss()
                    
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.bordered)

            }
            
            .navigationTitle("New List")
            
        }
    }
}

struct AddShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListScreen()
    }
}

//
//  ContentView.swift
//  GroceryApp
//
//  Created by Mohammad Azam on 5/23/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if shoppingLists.isEmpty {
                    Text("No shopping lists!")
                }
                
                List {
                    ForEach(shoppingLists, id: \.id) { shoppingList in
                        NavigationLink {
                           ShoppingListItemsScreen(shoppingList: shoppingList)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(shoppingList.title)
                                Text(shoppingList.address)
                                    .opacity(0.4)
                            }
                        }
                       
                    }.onDelete(perform: $shoppingLists.remove)
                }
                
                    .navigationTitle("Grocery App")
                   
            }
            .sheet(isPresented: $isPresented, content: {
                AddShoppingListScreen()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // action
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  CategoryFilterView.swift
//  GroceryApp
//
//

import SwiftUI

struct CategoryFilterView: View {
    
    let categories = ["All", "Produce", "Fruit", "Meat", "Condiments", "Beverages", "Snacks", "Dairy"]
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .frame(minWidth: 100)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(selectedCategory == category ? .orange: .green)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
        }
    }
}

struct CategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterView(selectedCategory: .constant("Meat"))
    }
}

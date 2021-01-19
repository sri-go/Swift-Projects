//
//  Grid.swift
//  AppOne
//
//  Created by Sri Gowda on 1/16/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    // Initalizing variables used
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    // _ in function means we don't have to provide name when using function
    // @escaping allows you to take the function parameter and use it later outside of the scope of the local function
    // this function lives in the heap and has pointers to it
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        // using "self" here to refer to items in the scope of struct
        // vs local function scope
        self.items = items
        self.viewForItem = viewForItem
    }
    
    // The view that gets built
    var body: some View {
        GeometryReader{ geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    // Function that simplifies above logic
    func body(for layout: GridLayout ) -> some View {
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }
    
    // Function that simplifies above logic further
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)
        
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
   
}

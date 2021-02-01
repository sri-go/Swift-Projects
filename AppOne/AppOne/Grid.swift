//
//  Grid.swift
//  AppOne
//
//  Created by Sri Gowda on 1/16/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    // Initalizing variables used
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
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
    private  func body(for layout: GridLayout ) -> some View {
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }
    
    // Function that simplifies above logic further
    private func body(for item: Item, in layout: GridLayout) -> some View {
        // "!" after a variable, allows you to access the value by force
        // typically done when used with an optional type, to 
        let index = items.firstIndex(matching: item)!
        
        return Group {
            if index != nil {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            } 
        }
    }
}

/* MARK: - Notes

 "_" in function means we don't have to provide name when using function
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){ }

 "@escaping" allows you to take the function parameter and use it later outside of the scope of the local function
 this function lives in the heap and has pointers to it

     init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
         self.items = items
         self.viewForItem = viewForItem
     }
 
 */

//
//  Array+Identifiable.swift
//  AppOne
//
//  Created by Sri Gowda on 1/18/21.
//

import Foundation

// Adds an extension to the Array Type
// Adds a function to find the first match of a given item in an Array
extension Array where Element: Identifiable {
    // Return type of Optional Int
    // Allows you to return nil
    func firstIndex(matching: Element) -> Int? {
        
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        
        return nil
    }
}

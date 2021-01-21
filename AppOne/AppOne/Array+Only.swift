//
//  Array+Only.swift
//  AppOne
//
//  Created by Sri Gowda on 1/20/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

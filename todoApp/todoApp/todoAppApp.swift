//
//  todoAppApp.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import SwiftUI

@main
struct todoAppApp: App {
    @ObservedObject var model: TodoListViewModel = TodoListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}

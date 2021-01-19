//
//  todoAppApp.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import SwiftUI

@main
struct todoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: TodoListViewModel())
        }
    }
}

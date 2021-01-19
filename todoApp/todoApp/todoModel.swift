//
//  TodoModel.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import Foundation

struct TodoList<TodoContent> {
    var todos: Array<TodoItem>;
    
    init(){
        todos = Array<TodoItem>();
    }
    
    mutating func addTodo(todo: TodoItem){
        print("This is the todo \(todo)")
        todos.append(todo)
    }
    
    struct TodoItem: Identifiable {
        let id = UUID()
        var content: String
    }
}

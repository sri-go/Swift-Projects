//
//  TodosViewModel.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import Foundation

class TodoListViewModel: ObservableObject{
    @Published private var model: TodoList<String> = createTodoList()
    
    static func createTodoList() -> TodoList<String> {
        return TodoList<String>();
    }
    
    // MARK: - Access to Model
    var todos: Array<TodoList<String>.TodoItem>{
        return model.todos
    }
    
    // MARK: - Intent(s)
    func addTodo(todo: TodoList<String>.TodoItem){
        model.addTodo(todo: todo)
    }
}

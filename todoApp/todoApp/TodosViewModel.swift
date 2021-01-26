//
//  TodosViewModel.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import Foundation

class TodoListViewModel: ObservableObject{
    @Published private var model: TodoList
    
    init(){
        model = TodoList()
    }
    
    // MARK: - Access to Model
    var todos: Array<TodoList.TodoItem>  {
        return model.todos
    }

    // MARK: - Intent(s)
    func addTodo(todo: TodoList.TodoItem) {
        model.addTodo(todo: todo)
    }
    
    func saveTodos() {
        model.saveTodos()
    }
    
    func deleteTodo(at offsets: IndexSet) {
        model.deleteTodo(at: offsets)
    }
    
    func updateTodo(todo: TodoList.TodoItem){
        model.updateStatus(todo: todo)
    }
}

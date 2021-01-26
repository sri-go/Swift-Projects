//
//  TodoModel.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import Foundation

struct TodoList {
    var todos: Array<TodoItem>
    private let todosKey = "todosKey"
    
    init(){
        // load todos if available else init empty array
        if let todosData = UserDefaults.standard.value(forKey: todosKey) as? Data {
            if let todosList = try? PropertyListDecoder().decode(Array<TodoItem>.self, from: todosData) {
                self.todos = todosList
                return 
            }
        }
        
        todos = Array<TodoItem>()
    }
    
    mutating func addTodo(todo: TodoItem){
        print("This is the todo \(todo)")
        todos.append(todo)
    }
    
    func saveTodos()  {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(todos), forKey: todosKey)
    }
    
    mutating func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        saveTodos()
    }
    
    mutating func updateStatus(todo: TodoList.TodoItem){
        for index in 0..<todos.count{
            if todos[index].id == todo.id {
                todos[index].status = !todos[index].status
                print("after: \(todo)")
            }
        }
    }
    
    struct TodoItem: Identifiable, Codable {
        var id = UUID()
        let todoContent: String
        var status: Bool = false
    }
}

/* MARK: - Notes
 
 Todo item status:
 1) default item to false on creation
 2) on button action
    -> send the todo index
    -> if the status is false: set to true
    -> if the status is true: set to false
 3)
 
 */

//
//  ContentView.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: TodoListViewModel
    @State var newTodo = ""
    
    init() {
        self.viewModel = TodoListViewModel()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("Add Todos....", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        guard !self.newTodo.isEmpty else { return }
                        viewModel.addTodo(todo: TodoList.TodoItem(todoContent: newTodo))
                        newTodo = ""
                        viewModel.saveTodos()
                    }){
                        Image(systemName: "plus").padding(.leading, 5)
                    }
                }.padding()
                
                List {
                    ForEach(viewModel.todos) { todo in
                        TodoView(todo: todo)
                    }
                    .onDelete(perform: viewModel.deleteTodo)
                    
                }.listStyle(PlainListStyle())
            
            }.navigationBarTitle("Todos")
        }
    }
}

struct TodoView: View {
    var todo: TodoList.TodoItem
    
    var body: some View {
        Text(todo.todoContent)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

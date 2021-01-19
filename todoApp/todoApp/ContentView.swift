//
//  ContentView.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    // @ObservedObject looks to the "View Model" to see if there are any changes and then
    // redraws the view
    @ObservedObject var viewModel: TodoListViewModel = TodoListViewModel()
    @State var newTodo = ""
    
    var body: some View {
        NavigationView{
            VStack{
                
                HStack{
                    TextField("Add Todos....", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        guard !self.newTodo.isEmpty else { return }
                        viewModel.addTodo(todo: TodoList<String>.TodoItem(content: newTodo))
                        newTodo = ""
                    }){
                        Image(systemName: "plus").padding(.leading, 5)
                    }
                }.padding()
                
                List {
                    ForEach(viewModel.todos) { todo in
                        TodoView(todo: todo)
                    }
                }
            }
            .navigationBarTitle("Todos")
        }
    }
}

struct TodoView: View {
    var todo: TodoList<String>.TodoItem
    
    var body: some View {
        Text(todo.content)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: TodoListViewModel())
    }
}

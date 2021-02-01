//
//  ContentView.swift
//  todoApp
//
//  Created by Sri Gowda on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: TodoListViewModel

    @State var newTodo = ""
 
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
    @EnvironmentObject var viewModel: TodoListViewModel
    var todo: TodoList.TodoItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 30){
            CircleCheckMark(checkStatus: todo.status)
                .onTapGesture {
                    if !todo.status {
                        withAnimation(Animation.easeIn(duration: 0.5)){
                            viewModel.updateTodo(todo: todo)
                            viewModel.saveTodos()
                        }
                    }else {
                        withAnimation {
                            viewModel.updateTodo(todo: todo)
                            viewModel.saveTodos()
                        }
                    }
                }
            
            Text(todo.todoContent)
                .foregroundColor(todo.status ? Color.gray.opacity(0.2) : Color.black)
        }
    }

}

struct CircleCheckMark: View {
    var checkStatus: Bool
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(checkStatus ? Color.green : Color.gray.opacity(0.25))
                .frame(width: 30, height: 30)

            if checkStatus {
                Image(systemName: "checkmark")
                    .scaleEffect(CGSize(width: 0.85, height: 0.85))
                    .foregroundColor(Color.white)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TodoListViewModel())
    }
}

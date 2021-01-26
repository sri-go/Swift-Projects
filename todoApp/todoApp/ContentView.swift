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
    
//    init() {
//        self.viewModel = TodoListViewModel()
//    }
    
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

    @State var trimVal: CGFloat = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 30){
            CircleCheckMark(checkStatus: todo.status, trimVal: $trimVal)
                .onTapGesture {
                    if !todo.status {
                        withAnimation(Animation.easeIn(duration: 0.5)){
                            self.trimVal = 1
                            viewModel.updateTodo(todo: todo)
                        }
                    }else {
                        withAnimation {
                            self.trimVal = 0
                            viewModel.updateTodo(todo: todo)
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
    @Binding var trimVal: CGFloat
    
    var animatableData: CGFloat {
        get { trimVal }
        set { trimVal = newValue }
    }
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0, to: trimVal)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(width: 30, height: 30)
                .foregroundColor(checkStatus ? Color.green : Color.gray)
                .overlay(
                    Circle()
                        .fill(checkStatus ? Color.green : Color.gray.opacity(0.2))
                        .frame(width: 20, height: 20)
                )
            
            if checkStatus {
                Image(systemName: "checkmark")
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

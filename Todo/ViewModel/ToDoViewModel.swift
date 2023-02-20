//
//  ToDoViewModel.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import Foundation

class ToDoListViewModel : ObservableObject{
    
    
    @Published var todos : [Task] = [
        Task(title: "Study", description: "Maths Class", currDate: "16/02/2023"),
        Task(title: "Market", description: "Buy Fruits", currDate: "17/02/2023")
    ]
    
   
    
    func updateItem(todo: Task, ind : String) {
            if let index = todos.firstIndex(where: { $0.id == ind }) {
                todos[index] = todo
            }else{
                print(todo.title)
                todos.append(todo)
            }
        }
    
    func deleteItem(ind : String){
        todos.removeAll(where: {$0.id == ind})
    }
    
}



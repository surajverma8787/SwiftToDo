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
    
    func addTask(todo : Task){
        todos.append(todo)
    }
    
}



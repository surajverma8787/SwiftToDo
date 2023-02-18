//
//  ListView.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import SwiftUI

struct ListView: View {
    
    var todos : [Task]
    
    init(todos: [Task]) {
        self.todos = todos
    }
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(20)
                .background(.purple)
                .foregroundColor(.white)
                .clipShape(Rectangle())
                .cornerRadius(30)
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(todos) { todo in
                        
                   VStack{
                            Text("Title :   \(todo.title)")
                            Text("Desc :   \(todo.description)")
                            Text("Created Time : \(todo.currDate)")
                    }
                        
                    HStack{
                        
                        Button("Edit"){
                        
                        }
                        .padding(20)
                        .buttonStyle(GrowingButton())
                        
                        Button("Delete"){
                          
                        }
                        .padding(20)
                        .buttonStyle(GrowingButton())
                    }
                       
                        

                        
                    
                }
            }
            
            .navigationTitle("View List")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
       ListView(todos: [Task(title: "Wash", description: "Wash Clothes", currDate: "15/09/2022")])
    }
}

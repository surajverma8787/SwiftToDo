//
//  ListView.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var todoViewModel : ToDoListViewModel
    
    
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
    
    @State var deleteId : Bool = false
    
    var body: some View {
        
        
       
            NavigationView{
                List{
                    
                    ForEach(todoViewModel.todos, id : \.self) { todo in
                            
                       VStack{
                                Text("Title :   \(todo.title)")
                                Text("Desc :   \(todo.description)")
                                Text("Created Time : \(todo.currDate)")
                        }
                        
                    }
                    .onDelete(perform: todoViewModel.removeTask)
                    
                }
                
                .navigationTitle("View List")
            }
        
       
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(todoViewModel: ToDoListViewModel())
    }
}

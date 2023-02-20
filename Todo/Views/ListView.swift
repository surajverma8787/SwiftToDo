//
//  ListView.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var todoViewModel : ToDoListViewModel
    
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(10)
                .background(.purple)
                .foregroundColor(.white)
                .clipShape(Rectangle())
                .cornerRadius(50)
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    @State var deleteId : Bool = false
    @State var navigated : Bool = false
    
    var body: some View {
        
           
                List{
                    
                    ForEach(todoViewModel.todos, id : \.self) { todo in
                            
                       VStack{
                                Text("Title :   \(todo.title)")
                                Text("Desc :   \(todo.description)")
                                Text("Created Time : \(todo.currDate)")
                        }
                        
                        HStack{
                        
                            NavigationLink("Edit Todo", destination: AddView(isEditing : true, index : todo.id, editTodo: todo))
                                .foregroundColor(Color.blue)
                            
//                            NavigationStack{
//                                VStack{
//                                    Button("Edit"){
//                                        navigated = true
//                                    }
//                                    .buttonStyle(GrowingButton())
//                                }
//                                .navigationDestination(isPresented: $navigated){
//                                    AddView(isEditing : true, index : todo.id, editTodo: todo)
//                                }
//                            }
                            
                            
                            
                            Button("Delete"){
                                
                                todoViewModel.deleteItem(ind: todo.id)
                            }
                            .buttonStyle(GrowingButton())
                            
                        }
                      
                        
                    }
                    
                    
                }
                
            
        
       
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ToDoListViewModel())
    }
}

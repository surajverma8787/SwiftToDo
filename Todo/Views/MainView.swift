//
//  MainView.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import SwiftUI

struct MainView: View {
    
    let string = " 29 October 2019 20:15:55 +0200"
    
    @ObservedObject var todoVM = ToDoListViewModel()
    
    init(todoVM: ToDoListViewModel = ToDoListViewModel()) {
        self.todoVM = todoVM
    }

    let dateFormatter : DateFormatter = {
        
    let d = DateFormatter()
    d.dateFormat = "dd MMM yyyy HH:mm:ss Z"
    return d
        
    }()
    
    @State var newItemTitle : String = ""
    @State var newItemDesc : String = ""
    @State var isSubmit : Bool = false
    
    struct OvalTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(20)
                .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
        }
    }
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    var body: some View {
        VStack{
            
            NavigationView{
                Form{
                
                    Section(header: Text("Add List")
                        .font(.custom("Arial", size : 20))){
                            
                            NavigationLink("Add List"){
                                
                                TextField("Enter Item Title", text: $newItemTitle).textFieldStyle(OvalTextFieldStyle())
                                
                                TextField("Enter Item Desc", text: $newItemDesc)
                                    .textFieldStyle(OvalTextFieldStyle())
                                
                                Button("Submit"){
                                    
                                    let d = Date()
                                    let newDate = dateFormatter.string(from: d)
                                    
                                    let newTodo = Task(title: newItemTitle, description: newItemDesc, currDate: newDate)
                                    if (newItemDesc != "" && newItemTitle != ""){
                                        todoVM.addTask(todo: newTodo)
                                        isSubmit = true
                                    }
                                
                                }
                                .padding(50)
                                .buttonStyle(GrowingButton())
                                
                            }
                    }
                    
                    Section(header : Text("View List")){
                        NavigationLink("Show Todos", destination: ListView(todos: todoVM.todos))
                    }
                    
                }
                
                
               
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}




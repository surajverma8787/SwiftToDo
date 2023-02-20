//
//  AddView.swift
//  Todo
//
//  Created by Suraj Verma on 19/02/23.
//

import SwiftUI

struct AddView: View {
    
    let string = " 29 October 2019 20:15:55"
    
    @EnvironmentObject var todoVM : ToDoListViewModel
    
    let dateFormatter : DateFormatter = {
        
    let d = DateFormatter()
    d.dateFormat = "dd MMM yyyy HH:mm:ss"
    return d
        
    }()
    
    @State var newItemTitle : String = ""
    @State var newItemDesc : String = ""
    @State var isSubmitted : Bool = false
    var isEditing : Bool
    @State var isSuccessEdited : Bool = false
    var index : String
    var editTodo : Task?
    
    
    
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
            TextField("Enter Item title", text: $newItemTitle).textFieldStyle(OvalTextFieldStyle())
            
            TextField("Enter Item Desc", text: $newItemDesc).textFieldStyle(OvalTextFieldStyle())
            
            
            Button("Submit"){
                
                let d = Date()
                let newDate = dateFormatter.string(from: d)
                
                let newTodo = Task(id : index, title: newItemTitle, description: newItemDesc, currDate: newDate)
                
             
                if (newItemDesc != "" && newItemTitle != ""){
                   
                    if(isEditing){
                        isSuccessEdited = true
                        todoVM.updateItem(todo: newTodo, ind: index)
                        newItemDesc = ""; newItemTitle = ""
                    }
                    else{
                        todoVM.todos.append(newTodo)
                        isSubmitted = true
                        newItemDesc = ""; newItemTitle = ""
                    }
                    
                }
                
                
            }
            .padding(50)
            .buttonStyle(GrowingButton())
            
            if(isSubmitted){
                Text("Todo Submitted")
                    .font(.custom("Arial", size: 30))
                
            }
            
            if(isSuccessEdited){
                Text("Todo Edited")
                    .font(.custom("Arial", size: 30))
            }
        }
            .onAppear{
                if(isEditing){
                    newItemDesc = editTodo?.description ?? ""
                    newItemTitle = editTodo?.title ?? ""
                }
            }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isEditing: false, index : "")
            .environmentObject(ToDoListViewModel())
    }
}

//
//  MainView.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var todoVM = ToDoListViewModel()
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section(header: Text("Add List")
                        .font(.custom("Arial", size : 20))){
                            
                            NavigationLink("Add List"){
                                AddView(isEditing : .constant(false))
                            }
                        }
                  
                    Section(header : Text("View List")){
                        NavigationLink("Show Todos", destination: ListView())
                    }
                }
            }
            .environmentObject(todoVM)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ToDoListViewModel())
            
    }
}






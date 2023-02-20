//
//  Task.swift
//  Todo
//
//  Created by Suraj Verma on 18/02/23.
//

import Foundation

struct Task : Identifiable, Hashable{
    
    var id = UUID().uuidString
    var title : String
    var description : String
    var currDate : String

    
}


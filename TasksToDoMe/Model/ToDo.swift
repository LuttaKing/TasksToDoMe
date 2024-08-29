//
//  ToDo.swift
//  TasksToDoMe
//
//  Created by Denilson Washuma on 26/08/2024.
//

import Foundation
import SwiftData

@Model
class ToDo: Identifiable {
    let id = UUID()
    var title:String
    var isComplete:Bool = false
    var dateCreated: String = "date"
    var category: String
    
    init(title: String, isComplete: Bool, category: String) {
        self.title = title
        self.isComplete = isComplete
        
        self.category = category
    }
    
    
   
}

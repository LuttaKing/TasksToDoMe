//
//  DetailPage.swift
//  TasksToDoMe
//
//  Created by Denilson Washuma on 29/08/2024.
//

import SwiftUI

struct DetailPage: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var toDo:ToDo
    @State private var toDoTitle:String = ""
    
    
    var body: some View {
        VStack{
            
            Text(toDo.title)
            
            TextField("Edit your to do", text: $toDoTitle)
                .onAppear{
                    toDoTitle = toDo.title
                }
                
            Button(action: {
                //update
                toDo.title = toDoTitle
                toDo.isComplete = true
                try? modelContext.save()
                dismiss()
            }, label: {
                Text("Save")
            })
            .buttonStyle(.borderedProminent)
            
            
            
            
        }
    }
}

//#Preview {
//    DetailPage()
//}

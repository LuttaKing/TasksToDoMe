//
//  ToDoTile.swift
//  TasksToDoMe
//
//  Created by Denilson Washuma on 26/08/2024.
//

import SwiftUI

struct ToDoTile: View {
    @Environment(\.modelContext) private var modelContext
   @State var todo:ToDo
    
    @State private var isAnimating = false

    
   
    var body: some View {
        HStack {
            
            Image(systemName:todo.isComplete ? "checkmark.rectangle" : "rectangle") //
                .resizable()
                .foregroundStyle(.black)
                .frame(width: 28,height: 19)
                .padding(.trailing,5)
                .onTapGesture {
                //    todo.toggleComplete()
                    todo.isComplete.toggle()
                    
                }
            
            Text(todo.title)
                .font(.system(size: 19))
                .foregroundStyle(.black)
            Spacer()
            Text("DELETE")
                .font(.system(size: 12))
                .foregroundStyle(.red)
                
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAnimating.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { //wait
                            modelContext.delete(todo) //delete
                              }
                             
                         }
        
                    
                }
        }
        .padding(.vertical,20)
        .padding(.horizontal,15)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.bottom,14)
        .offset(x: isAnimating ? -400 : 0)
    }
}

#Preview {
    HomeView()
}

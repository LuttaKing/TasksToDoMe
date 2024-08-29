//
//  ContentView.swift
//  TasksToDoMe
//
//  Created by Denilson Washuma on 26/08/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var toDos: [ToDo]
    
  
    
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment:.leading) {
                    HStack {
                        
                    
                        Text("Hello Lutta!")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        
                        
                        Spacer()
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundStyle(Color("appGreen"))
                            .padding(.trailing,7)
                            .onTapGesture {
                                let toDo = ToDo(title: "\(toDos.count). Added By Click", isComplete: false, category: "Category")
                                modelContext.insert(toDo)
                            }
                           
                        
                        Image("po")
                            .resizable()
                            .frame(width: 56,height: 56)
                         .cornerRadius(60)
                    }
                    

                        
                    
                    ZStack {
                        
                        Rectangle()
                            .fill(Color("appGreen"))
                            .cornerRadius(15)
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                        
                        Text("Manage your \ntime well")
                            .font(.title3.bold())
                            .foregroundStyle(.white)
                            .offset(x:-90)
                            
                    }
                    
                    
                    Text("Categories")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    HStack{
                        CategoryBox(name: "Work", image: "creditcard", color: .blue)
                        Spacer()
                        CategoryBox(name: "Personal", image: "person", color: .orange)
                        Spacer()
                        CategoryBox(name: "Shopping", image: "cart", color: .green)
                        Spacer()
                        CategoryBox(name: "Health", image: "thermometer", color: .pink)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom,10)
                    
                    Text("You have \(toDos.count) tasks today")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    ForEach(toDos.reversed()){ toDo in
                        NavigationLink {
                           DetailPage(toDo: toDo)
                        } label: {
                            ToDoTile(todo: toDo)
                                .animation(.default)
                               
                        }
                        
                    }
                    

                   
                    
                        Spacer()
                    
                }
                .padding(.horizontal,25)
            
            }
            .background(Color("backColor"))
        }
    }
}

#Preview {
    HomeView()
}

struct CategoryBox: View {
    var name:String
    var image: String
    var color: Color
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 23,height: 23)
                .foregroundStyle(color.opacity(0.7))
                .padding(15)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            
            Text(name)
                .font(.system(size: 17))
                .fontWeight(.light)
                .padding(.top,5)
        }
    }
}



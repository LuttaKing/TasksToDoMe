//
//  ContentView.swift
//  TasksToDoMe
//
//  Created by Denilson Washuma on 26/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var todoList: [ToDo] = [
        ToDo(title: "Test ing!", category: "Category"),
        ToDo(title: "Test ing!2", category: "Category"),
    ]
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Text("Hello Lutta!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                
                
                Spacer()
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 35,height: 35)
                    .foregroundStyle(Color("appGreen"))
                    .padding(.trailing,7)
                   
                
                Image("panda")
                    .resizable()
                    .frame(width: 60,height: 60)
                 .cornerRadius(13)
            }
            

                
            
            ZStack {
                Rectangle()
                    .fill(Color("appGreen"))
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity,maxHeight: 100)
                
                Text("Manage your \ntime well")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .offset(x:-70)
                    
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
            
            Text("You have 10 tasks today")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.vertical)
            
            
            HStack {
                
                Image(systemName: "rectangle") //checkmark.rectangle
                    .resizable()
                    .frame(width: 28,height: 19)
                    .padding(.trailing,5)
                    .onTapGesture {
                      
                    }
                
                Text("Daily UI Challenge")
                    .font(.system(size: 19))
                Spacer()
                Text("09:45 am")
                    .font(.system(size: 16))
                    .foregroundStyle(Color("appGreen"))
            }
            .padding(.vertical,20)
            .padding(.horizontal,15)
            
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            
            
            
            
            
            
                Spacer()
            
        }
        .padding(.horizontal,25)
        .background(Color("backColor"))
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
                .padding(16)
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

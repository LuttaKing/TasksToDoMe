//
//  TasksToDoMeApp.swift
//  TasksToDoMe
//
//  Created by Denilson Washuma on 26/08/2024.
//

import SwiftUI
import SwiftData

@main
struct TasksToDoMeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: ToDo.self)
    }
}

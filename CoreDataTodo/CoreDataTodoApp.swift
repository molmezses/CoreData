//
//  CoreDataTodoApp.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import SwiftUI

@main
struct CoreDataTodoApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}

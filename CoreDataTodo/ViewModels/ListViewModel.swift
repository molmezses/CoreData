//
//  ListViewModel.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import Foundation
import SwiftUI



class ListViewModel: ObservableObject {
    
    @Published var textFieldText: String = ""
    @Published var items: [ItemModel] = []
    
    
    
    init() {
        getItems()
    }
    
    func addItem() {
        guard !textFieldText.isEmpty else {return}
        let newItem = ItemModel(title: textFieldText, isCompleted: false)
        items.append(newItem)
        textFieldText = ""
        
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is todo item one", isCompleted: true),
            ItemModel(title: "This is two", isCompleted: false),
            ItemModel(title: "Third!", isCompleted: true),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
}

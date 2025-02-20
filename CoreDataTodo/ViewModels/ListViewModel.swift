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
    @Published var showWarning: Bool = false
    @Published var animate: Bool = false
    let secondaryAccentColor = Color(.green)
    
    
    
    init() {
        getItems()
    }
    
    func addItem() {
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
    
    func saveButtonPressed(){
        if textFieldText.isEmpty || textFieldText.count < 5 {
            showWarning = true
        }else{
            showWarning = false
            addItem()
            print("Successfully saved!")
        }
    }
    
    func addAnimation(){
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                self.animate.toggle()
            }
        }
    }
   
    
    
    
}

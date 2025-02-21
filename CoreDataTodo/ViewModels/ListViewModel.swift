//
//  ListViewModel.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import Foundation
import SwiftUI
import CoreData

class ListViewModel: ObservableObject {
    
    @Published var textFieldText: String = ""
    @Published var showWarning: Bool = false
    @Published var animate: Bool = false
    let secondaryAccentColor = Color(.green)
    let manager = CoreDataManager.instance
    @Published var items : [ItemEntity] = []
    @Published var isUpdate: Bool = false
    
    
    
    init() {
        fetchData()
    }
    
   
    func deleteItems(indexSet: IndexSet) {
        indexSet.forEach { index in
            let entity = items[index]
            manager.context.delete(entity)
        }
        manager.saveData()
        fetchData()
    }
    
    func saveButtonPressed(){
        if textFieldText.isEmpty || textFieldText.count < 5 {
            showWarning = true
        }else{
            showWarning = false
            addData()
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
    
    func addData(){
        let newData = ItemEntity(context: manager.context)
        newData.title =  textFieldText
        newData.isCompleted = false
        manager.saveData()
        save()
    }
    
    func fetchData() {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        
        do {
            items = try manager.context.fetch(request)
        } catch {
            print("Error Fetching data \(error.localizedDescription)")
        }
        
        if self.items.count > 0 {
            isUpdate = false
        }
    }
    
    func updateData(entity: ItemEntity){
        entity.isCompleted.toggle()
        self.manager.saveData()
        isUpdate = true
        self.items.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.00000){
            self.fetchData()
        }

    }
    
    func save(){
        items.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.fetchData()
            self.manager.saveData()
        }
    }
   
    
    
    
}

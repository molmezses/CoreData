//
//  ItemModel.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

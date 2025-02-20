//
//  ListRowView.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import SwiftUI

struct ListRowView: View {
    
    @State var title: String
    @State var isComplated: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: isComplated ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundStyle(isComplated ? .green : .red)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding(4)
    }
}

#Preview {
    ListRowView(title: "This is item")
}

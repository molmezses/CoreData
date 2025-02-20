//
//  ListView.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.items) { item in
                    ListRowView(title: item.title, isComplated: item.isCompleted)
                }
                .onDelete(perform: viewModel.deleteItems)
            }
            .navigationTitle("ToDo Lists 📝")
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddView()
                            .navigationBarBackButtonHidden()    
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .font(.title)
                            .foregroundStyle(.green)
                    }

                }
            }
        }
    }
    
    
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
}

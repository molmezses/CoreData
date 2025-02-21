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
            ZStack{
                if viewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }else{
                    List {
                        ForEach(viewModel.items) { item in
                            ListRowView(title: item.title ?? "no", isComplated: item.isCompleted)
                                .onTapGesture {
                                    viewModel.updateData(entity: item)
                                }
                        }
                        .onDelete(perform: viewModel.deleteItems)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Todo List🔖")
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
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}



//
//  AddView.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 19.02.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ListViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    TextField("Add a something here...", text: $viewModel.textFieldText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                    
                    Button {
                        viewModel.addItem()
                        dismiss()
                    } label: {
                        Text("Submit")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color(.systemGreen))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal)
                    }

                }
            }
            .navigationTitle("Add New Todo ✏️")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .bold()
                            .font(.title)
                            .foregroundStyle(.green)
                    }

                }
            }
        }
    }
}

#Preview {
    AddView()
        .environmentObject(ListViewModel())
}

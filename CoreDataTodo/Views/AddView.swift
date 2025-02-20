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
                    if viewModel.showWarning{
                        Text("Please enter a value longer than 5 characters")
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding(.horizontal)
                            .bold()
                    }
                    TextField("Add a something here...", text: $viewModel.textFieldText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(viewModel.showWarning ? Color.red : .clear)
                                .padding(.horizontal)
                        }
                        
                    
                    Button {
                        viewModel.saveButtonPressed()
                        !viewModel.showWarning ? dismiss() : nil
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
                    .padding(.top)
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
                            .font(.title)
                            .foregroundStyle(.gray)
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
